module bram_ram_1port_0 (
		input  wire [63:0] data,    //    data.datain
		output wire [63:0] q,       //       q.dataout
		input  wire [8:0]  address, // address.address
		input  wire        wren,    //    wren.wren
		input  wire        clock    //   clock.clk
	);
endmodule

