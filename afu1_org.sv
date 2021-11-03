`include "platform_if.vh"
`include "afu_json_info.vh"

module afu
 (
  
    ofs_plat_avalon_mem_if.to_master mmio64_if
   );
   
   logic clk;
    assign clk = mmio64_if.clk;
    logic reset_n;
    assign reset_n = mmio64_if.reset_n;

  // =============================================================
   // Constants for the memory-mapped block RAM (BRAM)
   //
   // BRAM_RD_LATENCY: the read latency of the BRAM. NOTE: this constant cannot
   //                  be changed without changing the timing of the block RAM.
   //                  This is solely a named constant to avoid having hardcoded
   //                  literals throughout the code.
   // BRAM_WORDS: Number of words in the block RAM.
   // BRAM_ADDR_WIDTH: The address width of the block RAM.
   // BRAM_DATA_WIDTH: The data width of each block RAM word.
   // BRAM_BASE_MMIO_ADDR: MMIO address where the first BRAM word is mapped.
   // BRAM_UPPER_MMIO_ADDR: MMIO address of the last BRAM word.
   // ============================================================= 
   localparam int BRAM_RD_LATENCY = 2;
   localparam int BRAM_WORDS = 512;
   localparam int BRAM_ADDR_WIDTH = $clog2(BRAM_WORDS);
   localparam int BRAM_DATA_WIDTH = 64;
   localparam [15:0] BRAM_BASE_MMIO_ADDR = 16'h0020;
   localparam [15:0] BRAM_UPPER_MMIO_ADDR = BRAM_BASE_MMIO_ADDR + BRAM_WORDS*2 - 2;

   logic[127:0] afu_id = `AFU_ACCEL_UUID;
   
 

  typedef logic [63:0] t_mmio_value;
    typedef logic [15:0] t_csr_idx;


function automatic int mask_to_idx(int mask_bits, logic [63:0] mask);
        int idx = mask_bits;

        for (int i = 0; i < mask_bits; i = i + 1)
        begin
            if (mask[i] != 1'b0)
            begin
                idx = i;
                break;
            end
        end

        return idx;
    endfunction
    
    
     // ====================================================================
    //
    //  Assert waitrequest often just to torture the slave code.
    //
    // ====================================================================

    logic [15:0] waitrequest_vec;
    assign mmio64_if.waitrequest = waitrequest_vec[0];
    //assign mmio512_if.waitrequest = waitrequest_vec[8];

    always_ff @(posedge clk)
    begin
        waitrequest_vec <= { waitrequest_vec[14:0], waitrequest_vec[15] };

        if (!reset_n)
        begin
            waitrequest_vec <= { ~15'b0, 1'b0 };
        end
    end
    
      // ====================================================================
    //
    //  Store write requests in a register that can be read back to
    //  verify the success of the writes.
    //
    // ====================================================================


    t_mmio_value wr_data_64;
    logic [7:0] wr_mask_64;
    logic [mmio64_if.ADDR_WIDTH_-1 : 0] wr_addr_64;
    // Byte offset within the 64 bit entry
    logic [2:0] wr_byte_idx_64;
    
    // Get mmio request header.
   t_csr_idx mmio_address;
   assign mmio_address = t_csr_idx'(mmio64_if.address);



   // Block RAM signals.
   // Similarly, $clog2 is used here to calculated the width of the address lines
   // based on the number of words.
   logic bram_wr_en;
   logic [BRAM_ADDR_WIDTH-1:0] bram_wr_addr, bram_rd_addr, bram_addr;
   logic [BRAM_DATA_WIDTH-1:0]  bram_rd_data;

   // MMIO address after applying the offset of base MMIO address of the BRAM. 
   logic [15:0] offset_addr;

   // Variables used for delaying various signals.
   logic [15:0]  addr_delayed;
   logic  mmioRdValid_delayed;

     // Instantiate a block RAM with 2^BRAM_ADDR_WIDTH words, where each word is
   // BRAM_DATA_WIDTH bits. Internally, this block RAM registers the output
   // which leads to a 2-cycle read latency. However, the address is also
   // registered below, which results in a 3-cycle read latency. This delay
   // is largely synthetic for this example to demonstrate multi-cycle reads,
   // although registered a block RAM output is common.
   //
   // Address 0 of the BRAM corresponds to MMIO address BRAM_BASE_MMIO_ADDR.
/*
   bram #(
	  .DATA_WIDTH(BRAM_DATA_WIDTH),
	  .ADDR_WIDTH(BRAM_ADDR_WIDTH)
	  )
   mmio_bram (
	      .clk(clk),
	      .wr_en(bram_wr_en),
	      .wr_addr(bram_wr_addr),
	      .wr_data(mmio64_if.writedata[BRAM_DATA_WIDTH-1:0]),
	      .rd_addr(bram_rd_addr),
	      .rd_data(bram_rd_data)
	      );

*/
/*
 bram u0 (
        .clk_clk                     (clk),                     //   input,   width = 1,                 clk.clk
        .ram_1port_0_data_datain     (mmio64_if.writedata[BRAM_DATA_WIDTH-1:0]),     //   input,  width = 64,    ram_1port_0_data.datain
        .ram_1port_0_q_dataout       (bram_rd_data),       //  output,  width = 64,       ram_1port_0_q.dataout
        .ram_1port_0_address_address (bram_addr), //   input,   width = 9, ram_1port_0_address.address
        .ram_1port_0_wren_wren       (bram_wr_en),        //   input,   width = 1,    ram_1port_0_wren.wren
        .reset_reset                 (reset_n)                  //   input,   width = 1,               reset.reset
	 );
*/
/*
fifo u0 (
        .data    (mmio64_if.writedata[BRAM_DATA_WIDTH-1:0]),    //   input,  width = 64,    data.datain
        .q       (bram_rd_data),       //  output,  width = 64,       q.dataout
        .address (bram_addr), //   input,   width = 9, address.address
        .wren    (bram_wr_en),    //   input,   width = 1,    wren.wren
        .clock   (clk)    //   input,   width = 1,   clock.clk
    );
    
*/

bram   mmio_bram (
              .clk_clk(clk),
              .onchip_memory_write(bram_wr_en),
              .onchip_memory_address(bram_addr),
              .onchip_memory_writedata(mmio64_if.writedata[BRAM_DATA_WIDTH-1:0]),
              .onchip_memory_readdata(bram_rd_data),
              .reset_reset(reset_n),
              .onchip_memory_clken(1'b1),
              .onchip_memory_chipselect(1'b1),
              .onchip_memory_byteenable(8'b1)
              );

   // Misc. combinatonal logic for addressing and control.
//always_ff @(posedge clk) begin
always_comb begin  
logic [$size(mmio_address)-1:0] bram_offset_addr;
  
  bram_offset_addr = mmio_address - BRAM_BASE_MMIO_ADDR;	
  bram_addr = bram_offset_addr[BRAM_ADDR_WIDTH:1];
  
 // Define the bram write address.
      bram_wr_addr = bram_addr;
     // bram_rd_addr <= bram_addr;   
     // Write to the block RAM when there is a MMIO write request and the address falls
      // within the range of the BRAM
      if (mmio64_if.write && ! mmio64_if.waitrequest && ( mmio_address >= BRAM_BASE_MMIO_ADDR &&  mmio_address <= BRAM_UPPER_MMIO_ADDR ))
	bram_wr_en = 1'b1;
      else
	bram_wr_en = 1'b0;	
   end    

always_ff @(posedge clk) begin
bram_rd_addr <= bram_addr;
end



   // ====================================================================
    //
    //  Handle reads.
    //
    // ====================================================================

    //
    // Register read requests for use in the second cycle of reads.
    //
    logic read_req_q;
    t_csr_idx read_idx_q;

/*    always_ff @(posedge clk)
    begin : r_addr
        read_req_q <= mmio64_if.read && ! mmio64_if.waitrequest;
        read_idx_q <= t_csr_idx'(mmio64_if.address);

        if (!reset_n)
        begin
            read_req_q <= 1'b0;
        end
    end
*/
    // Reduce the mandatory feature header CSRs (read address 'h?)
    t_mmio_value dfh_afu_id_q;

    logic [31:0] req_byte_addr_64;
    assign req_byte_addr_64 = 32'({ mmio64_if.address,
                                    3'(mask_to_idx(8, mmio64_if.byteenable)) });

logic [63:0] afu_status_reg;
    assign afu_status_reg =
        { 32'h0,  // reserved
          16'(`OFS_PLAT_PARAM_CLOCKS_PCLK_FREQ),
          2'h0,   // 64 bit read/write bus
          10'h0,  // reserved
          4'h0    // Avalon MMIO interfaces
          };


//always_ff @(posedge clk)
 always_comb  
  begin
        mmio64_if.readdata = '0;
      
      case (addr_delayed)
  //        case (mmio_address)
         16'h0000: // AFU DFH (device feature header)
                begin
                    // Here we define a trivial feature list.  In this
                    // example, our AFU is the only entry in this list.
                   mmio64_if.readdata  = 64'b0;
                    // Feature type is AFU
                    mmio64_if.readdata[63:60] = 4'h1;
                    // End of list (last entry in list)
                     mmio64_if.readdata[40] = 1'b1;
                end
            // AFU_ID_L
            16'h0001: mmio64_if.readdata = afu_id[63:0];
            // AFU_ID_H
            16'h0002: mmio64_if.readdata = afu_id[127:64];
            // Full address of the request, including byte, replicated twice
            // so it can be read in either half as a 32 bit read.
            16'h0008: mmio64_if.readdata = { req_byte_addr_64, req_byte_addr_64 };
           
             // Status register
            16'h010: mmio64_if.readdata = afu_status_reg;

            default:
   // Check to see if the delayed address falls withing the 
 if (addr_delayed >= BRAM_BASE_MMIO_ADDR && addr_delayed <= BRAM_UPPER_MMIO_ADDR)
             mmio64_if.readdata = bram_rd_data;

        endcase
    end

    assign mmio64_if.response = '0;

 delay 
     #(
       .CYCLES(BRAM_RD_LATENCY),
       .WIDTH($bits(mmio64_if.read))	   
       )
   delay_valid 
     (
      .*,
      .en(1'b1),
      .data_in(mmio64_if.read && ! mmio64_if.waitrequest),
      .data_out(mmioRdValid_delayed)	      
      );

   assign mmio64_if.readdatavalid = mmioRdValid_delayed;

 // Delay the read address by the latency of the block RAM read.
   delay 
     #(
       .CYCLES(BRAM_RD_LATENCY),       
       .WIDTH($size(mmio_address))	   
       )
   delay_addr 
     (
      .*,
      .en(1'b1),
      .data_in(mmio_address),
      .data_out(addr_delayed)	      
      );

endmodule


     

    
    
 
