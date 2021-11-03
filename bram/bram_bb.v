module bram (
		input  wire        clk_clk,                  //           clk.clk
		input  wire [9:0]  onchip_memory_address,    // onchip_memory.address
		input  wire        onchip_memory_chipselect, //              .chipselect
		input  wire        onchip_memory_clken,      //              .clken
		input  wire        onchip_memory_write,      //              .write
		output wire [31:0] onchip_memory_readdata,   //              .readdata
		input  wire [31:0] onchip_memory_writedata,  //              .writedata
		input  wire [3:0]  onchip_memory_byteenable, //              .byteenable
		input  wire        reset_reset_n             //         reset.reset_n
	);
endmodule

