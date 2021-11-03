module bram_VexRiscvAxi4_0 (
		input  wire        clk,                       //             clock.clk
		input  wire        reset,                     //             reset.reset
		output wire        dBusAxi_aw_valid,          //           dBusaxi.awvalid
		input  wire        dBusAxi_aw_ready,          //                  .awready
		output wire [31:0] dBusAxi_aw_payload_addr,   //                  .awaddr
		output wire        dBusAxi_aw_payload_id,     //                  .awid
		output wire [3:0]  dBusAxi_aw_payload_region, //                  .awregion
		output wire [7:0]  dBusAxi_aw_payload_len,    //                  .awlen
		output wire [2:0]  dBusAxi_aw_payload_size,   //                  .awsize
		output wire [1:0]  dBusAxi_aw_payload_burst,  //                  .awburst
		output wire        dBusAxi_aw_payload_lock,   //                  .awlock
		output wire [3:0]  dBusAxi_aw_payload_cache,  //                  .awcache
		output wire [3:0]  dBusAxi_aw_payload_qos,    //                  .awqos
		output wire [2:0]  dBusAxi_aw_payload_prot,   //                  .awprot
		output wire        dBusAxi_w_valid,           //                  .wvalid
		input  wire        dBusAxi_w_ready,           //                  .wready
		output wire [31:0] dBusAxi_w_payload_data,    //                  .wdata
		output wire [3:0]  dBusAxi_w_payload_strb,    //                  .wstrb
		output wire        dBusAxi_w_payload_last,    //                  .wlast
		input  wire        dBusAxi_b_valid,           //                  .bvalid
		output wire        dBusAxi_b_ready,           //                  .bready
		input  wire        dBusAxi_b_payload_id,      //                  .bid
		input  wire [1:0]  dBusAxi_b_payload_resp,    //                  .bresp
		output wire        dBusAxi_ar_valid,          //                  .arvalid
		input  wire        dBusAxi_ar_ready,          //                  .arready
		output wire [31:0] dBusAxi_ar_payload_addr,   //                  .araddr
		output wire        dBusAxi_ar_payload_id,     //                  .arid
		output wire [3:0]  dBusAxi_ar_payload_region, //                  .arregion
		output wire [7:0]  dBusAxi_ar_payload_len,    //                  .arlen
		output wire [2:0]  dBusAxi_ar_payload_size,   //                  .arsize
		output wire [1:0]  dBusAxi_ar_payload_burst,  //                  .arburst
		output wire        dBusAxi_ar_payload_lock,   //                  .arlock
		output wire [3:0]  dBusAxi_ar_payload_cache,  //                  .arcache
		output wire [3:0]  dBusAxi_ar_payload_qos,    //                  .arqos
		output wire [2:0]  dBusAxi_ar_payload_prot,   //                  .arprot
		input  wire        dBusAxi_r_valid,           //                  .rvalid
		output wire        dBusAxi_r_ready,           //                  .rready
		input  wire [31:0] dBusAxi_r_payload_data,    //                  .rdata
		input  wire        dBusAxi_r_payload_id,      //                  .rid
		input  wire [1:0]  dBusAxi_r_payload_resp,    //                  .rresp
		input  wire        dBusAxi_r_payload_last,    //                  .rlast
		output wire        iBusAxi_ar_valid,          //           iBusaxi.arvalid
		input  wire        iBusAxi_ar_ready,          //                  .arready
		output wire [31:0] iBusAxi_ar_payload_addr,   //                  .araddr
		output wire        iBusAxi_ar_payload_id,     //                  .arid
		output wire [3:0]  iBusAxi_ar_payload_region, //                  .arregion
		output wire [7:0]  iBusAxi_ar_payload_len,    //                  .arlen
		output wire [2:0]  iBusAxi_ar_payload_size,   //                  .arsize
		output wire [1:0]  iBusAxi_ar_payload_burst,  //                  .arburst
		output wire        iBusAxi_ar_payload_lock,   //                  .arlock
		output wire [3:0]  iBusAxi_ar_payload_cache,  //                  .arcache
		output wire [3:0]  iBusAxi_ar_payload_qos,    //                  .arqos
		output wire [2:0]  iBusAxi_ar_payload_prot,   //                  .arprot
		input  wire        iBusAxi_r_valid,           //                  .rvalid
		output wire        iBusAxi_r_ready,           //                  .rready
		input  wire [31:0] iBusAxi_r_payload_data,    //                  .rdata
		input  wire        iBusAxi_r_payload_id,      //                  .rid
		input  wire [1:0]  iBusAxi_r_payload_resp,    //                  .rresp
		input  wire        iBusAxi_r_payload_last,    //                  .rlast
		output wire [31:0] iBusaxi_awaddr,            //                  .awaddr
		output wire [2:0]  iBusaxi_awprot,            //                  .awprot
		output wire        iBusaxi_awlock,            //                  .awlock
		output wire        iBusaxi_awvalid,           //                  .awvalid
		input  wire        iBusaxi_awready,           //                  .awready
		output wire [31:0] iBusaxi_wdata,             //                  .wdata
		output wire        iBusaxi_wlast,             //                  .wlast
		input  wire        iBusaxi_wready,            //                  .wready
		output wire        iBusaxi_wvalid,            //                  .wvalid
		input  wire        iBusaxi_bvalid,            //                  .bvalid
		output wire        iBusaxi_bready,            //                  .bready
		input  wire        iBusaxi_bid,               //                  .bid
		output wire        iBusaxi_awid,              //                  .awid
		input  wire        debugReset,                //        debugReset.reset
		output wire        debug_resetOut,            //    debug_resetOut.reset
		input  wire        externalInterrupt,         // externalInterrupt.irq
		input  wire        timerInterrupt,            //    timerInterrupt.irq
		input  wire        softwareInterrupt,         // softwareInterrupt.export
		input  wire        jtag_tms,                  //              jtag.export
		input  wire        jtag_tdi,                  //                  .export1
		output wire        jtag_tdo,                  //                  .export2
		input  wire        jtag_tck                   //                  .export3
	);
endmodule

