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
   localparam int BRAM_RD_LATENCY = 0;
   localparam int BRAM_WORDS = 512;
   localparam int BRAM_ADDR_WIDTH = $clog2(BRAM_WORDS);
   localparam int BRAM_DATA_WIDTH = 32;
   localparam [15:0] BRAM_BASE_MMIO_ADDR = 16'h0020;
   localparam [15:0] BRAM_UPPER_MMIO_ADDR = BRAM_BASE_MMIO_ADDR + BRAM_WORDS*2 - 2;

   logic[127:0] afu_id = `AFU_ACCEL_UUID;
   
 

  typedef logic [63:0] t_mmio_value;
    typedef logic [15:0] t_csr_idx;
    
    
     // ====================================================================
    //
    //  Assert waitrequest often just to torture the slave code.
    //
    // ====================================================================

    logic [15:0] waitrequest_vec;
    assign mmio64_if.waitrequest = waitrequest_vec[0];
     
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


   t_mmio_value mmio_writedata;
    
    // Get mmio request header.
   t_csr_idx mmio_address;
   assign mmio_address = t_csr_idx'(mmio64_if.address);



   // Block RAM signals.
   // Similarly, $clog2 is used here to calculated the width of the address lines
   // based on the number of words.
   logic bram_wr_en;
   logic [BRAM_ADDR_WIDTH-1:0] bram_wr_addr, bram_rd_addr, bram_addr;
   logic [BRAM_DATA_WIDTH-1:0]  bram_rd_data;


wire sync_dout;

altera_std_synchronizer #(
.depth (20)
) power_on_reset_std_sync_inst (
.clk	(clk),
.reset_n  (1'b1),
.din	(1'b1),
.dout	(sync_dout)
);

reg push=1'b1;
reg[31:0] count;
localparam constantNumber = 100;
reg clk_div;

always @(posedge clk)
begin
	if(!push)  count <= 32'b0;
else count <= count + 1'b1;
end


always @ (posedge clk)
begin
if (count == constantNumber - 1)
        clk_div <= !push;
    else
        clk_div <= push;
end



wire qsys_system_reset;

//assign qsys_system_reset  =  sync_dout  & clk_div & reset_n;
// assign qsys_system_reset  =   reset_n & clk_div;
 //assign qsys_system_reset  = sync_dout & reset_n;
   assign qsys_system_reset  =  sync_dout & clk_div & reset_n;
//assign qsys_system_reset = reset_n & pup_reset; 

bram   mmio_bram (
              .clk_clk(clk),
              .onchip_memory_write(bram_wr_en),
              .onchip_memory_address(bram_addr),
//            .onchip_memory_writedata(mmio64_if.writedata[BRAM_DATA_WIDTH-1:0]),
              .onchip_memory_writedata(mmio_writedata),
              .onchip_memory_readdata(bram_rd_data),
       //       .reset_reset_n(reset_n),
             .reset_reset_n(qsys_system_reset),
             .onchip_memory_clken(1'b1),
             .onchip_memory_chipselect(1'b1),
            //.onchip_memory_byteenable(8'b11111111)
              .onchip_memory_byteenable(4'b1111)
              );

   // Misc. combinatonal logic for addressing and control.
always_ff @(posedge clk) begin
//always_comb begin  
logic [$size(mmio_address)-1:0] bram_offset_addr;
  
  bram_offset_addr <= mmio_address - BRAM_BASE_MMIO_ADDR;	
  bram_addr <= bram_offset_addr[BRAM_ADDR_WIDTH:1];
 mmio_writedata <= mmio64_if.writedata[BRAM_DATA_WIDTH-1:0];
     // Write to the block RAM when there is a MMIO write request and the address falls
      // within the range of the BRAM
      if (mmio64_if.write && ! mmio64_if.waitrequest && ( mmio_address >= BRAM_BASE_MMIO_ADDR &&  mmio_address <= BRAM_UPPER_MMIO_ADDR ))
	bram_wr_en <= 1'b1;
      else
	bram_wr_en <= 1'b0;	
   end    

   // ====================================================================
    //
    //  Handle reads.
    //
    // ====================================================================

    //
    // Register read requests for use in the second cycle of reads.
    //
    // Reduce the mandatory feature header CSRs (read address 'h?)


always_ff @(posedge clk)
 //always_comb  
  begin
        mmio64_if.readdata <= '0;
        mmio64_if.readdatavalid <= mmio64_if.read && ! mmio64_if.waitrequest;
      case (mmio_address)
  //        case (mmio_address)
         16'h0000: // AFU DFH (device feature header)
                begin
                    // Here we define a trivial feature list.  In this
                    // example, our AFU is the only entry in this list.
                   mmio64_if.readdata  <= 64'b0;
                    // Feature type is AFU
                    mmio64_if.readdata[63:60] <= 4'h1;
                    // End of list (last entry in list)
                     mmio64_if.readdata[40] <= 1'b1;
                end
            // AFU_ID_L
            16'h0001: mmio64_if.readdata <= afu_id[63:0];
            // AFU_ID_H
            16'h0002: mmio64_if.readdata <= afu_id[127:64];
           
            default:
   // Check to see if the delayed address falls withing the 
 if (mmio_address >= BRAM_BASE_MMIO_ADDR && mmio_address <= BRAM_UPPER_MMIO_ADDR)
      begin
             mmio64_if.readdata <= bram_rd_data[31:0];
end
        endcase
    end

    assign mmio64_if.response = '0;

   //assign mmio64_if.readdatavalid = mmio64_if.read && ! mmio64_if.waitrequest;


endmodule


     

    
    
 
