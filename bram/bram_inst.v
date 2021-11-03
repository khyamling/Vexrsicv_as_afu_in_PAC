	bram u0 (
		.clk_clk                  (_connected_to_clk_clk_),                  //   input,   width = 1,           clk.clk
		.onchip_memory_address    (_connected_to_onchip_memory_address_),    //   input,  width = 10, onchip_memory.address
		.onchip_memory_chipselect (_connected_to_onchip_memory_chipselect_), //   input,   width = 1,              .chipselect
		.onchip_memory_clken      (_connected_to_onchip_memory_clken_),      //   input,   width = 1,              .clken
		.onchip_memory_write      (_connected_to_onchip_memory_write_),      //   input,   width = 1,              .write
		.onchip_memory_readdata   (_connected_to_onchip_memory_readdata_),   //  output,  width = 32,              .readdata
		.onchip_memory_writedata  (_connected_to_onchip_memory_writedata_),  //   input,  width = 32,              .writedata
		.onchip_memory_byteenable (_connected_to_onchip_memory_byteenable_), //   input,   width = 4,              .byteenable
		.reset_reset_n            (_connected_to_reset_reset_n_)             //   input,   width = 1,         reset.reset_n
	);

