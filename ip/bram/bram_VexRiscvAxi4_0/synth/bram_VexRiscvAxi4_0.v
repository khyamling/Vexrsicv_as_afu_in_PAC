// bram_VexRiscvAxi4_0.v

// Generated using ACDS version 19.2 57

`timescale 1 ps / 1 ps
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

	VexRiscvAxi4 vexriscvaxi4_0 (
		.clk                       (clk),                       //   input,   width = 1,             clock.clk
		.reset                     (reset),                     //   input,   width = 1,             reset.reset
		.dBusAxi_aw_valid          (dBusAxi_aw_valid),          //  output,   width = 1,           dBusaxi.awvalid
		.dBusAxi_aw_ready          (dBusAxi_aw_ready),          //   input,   width = 1,                  .awready
		.dBusAxi_aw_payload_addr   (dBusAxi_aw_payload_addr),   //  output,  width = 32,                  .awaddr
		.dBusAxi_aw_payload_id     (dBusAxi_aw_payload_id),     //  output,   width = 1,                  .awid
		.dBusAxi_aw_payload_region (dBusAxi_aw_payload_region), //  output,   width = 4,                  .awregion
		.dBusAxi_aw_payload_len    (dBusAxi_aw_payload_len),    //  output,   width = 8,                  .awlen
		.dBusAxi_aw_payload_size   (dBusAxi_aw_payload_size),   //  output,   width = 3,                  .awsize
		.dBusAxi_aw_payload_burst  (dBusAxi_aw_payload_burst),  //  output,   width = 2,                  .awburst
		.dBusAxi_aw_payload_lock   (dBusAxi_aw_payload_lock),   //  output,   width = 1,                  .awlock
		.dBusAxi_aw_payload_cache  (dBusAxi_aw_payload_cache),  //  output,   width = 4,                  .awcache
		.dBusAxi_aw_payload_qos    (dBusAxi_aw_payload_qos),    //  output,   width = 4,                  .awqos
		.dBusAxi_aw_payload_prot   (dBusAxi_aw_payload_prot),   //  output,   width = 3,                  .awprot
		.dBusAxi_w_valid           (dBusAxi_w_valid),           //  output,   width = 1,                  .wvalid
		.dBusAxi_w_ready           (dBusAxi_w_ready),           //   input,   width = 1,                  .wready
		.dBusAxi_w_payload_data    (dBusAxi_w_payload_data),    //  output,  width = 32,                  .wdata
		.dBusAxi_w_payload_strb    (dBusAxi_w_payload_strb),    //  output,   width = 4,                  .wstrb
		.dBusAxi_w_payload_last    (dBusAxi_w_payload_last),    //  output,   width = 1,                  .wlast
		.dBusAxi_b_valid           (dBusAxi_b_valid),           //   input,   width = 1,                  .bvalid
		.dBusAxi_b_ready           (dBusAxi_b_ready),           //  output,   width = 1,                  .bready
		.dBusAxi_b_payload_id      (dBusAxi_b_payload_id),      //   input,   width = 1,                  .bid
		.dBusAxi_b_payload_resp    (dBusAxi_b_payload_resp),    //   input,   width = 2,                  .bresp
		.dBusAxi_ar_valid          (dBusAxi_ar_valid),          //  output,   width = 1,                  .arvalid
		.dBusAxi_ar_ready          (dBusAxi_ar_ready),          //   input,   width = 1,                  .arready
		.dBusAxi_ar_payload_addr   (dBusAxi_ar_payload_addr),   //  output,  width = 32,                  .araddr
		.dBusAxi_ar_payload_id     (dBusAxi_ar_payload_id),     //  output,   width = 1,                  .arid
		.dBusAxi_ar_payload_region (dBusAxi_ar_payload_region), //  output,   width = 4,                  .arregion
		.dBusAxi_ar_payload_len    (dBusAxi_ar_payload_len),    //  output,   width = 8,                  .arlen
		.dBusAxi_ar_payload_size   (dBusAxi_ar_payload_size),   //  output,   width = 3,                  .arsize
		.dBusAxi_ar_payload_burst  (dBusAxi_ar_payload_burst),  //  output,   width = 2,                  .arburst
		.dBusAxi_ar_payload_lock   (dBusAxi_ar_payload_lock),   //  output,   width = 1,                  .arlock
		.dBusAxi_ar_payload_cache  (dBusAxi_ar_payload_cache),  //  output,   width = 4,                  .arcache
		.dBusAxi_ar_payload_qos    (dBusAxi_ar_payload_qos),    //  output,   width = 4,                  .arqos
		.dBusAxi_ar_payload_prot   (dBusAxi_ar_payload_prot),   //  output,   width = 3,                  .arprot
		.dBusAxi_r_valid           (dBusAxi_r_valid),           //   input,   width = 1,                  .rvalid
		.dBusAxi_r_ready           (dBusAxi_r_ready),           //  output,   width = 1,                  .rready
		.dBusAxi_r_payload_data    (dBusAxi_r_payload_data),    //   input,  width = 32,                  .rdata
		.dBusAxi_r_payload_id      (dBusAxi_r_payload_id),      //   input,   width = 1,                  .rid
		.dBusAxi_r_payload_resp    (dBusAxi_r_payload_resp),    //   input,   width = 2,                  .rresp
		.dBusAxi_r_payload_last    (dBusAxi_r_payload_last),    //   input,   width = 1,                  .rlast
		.iBusAxi_ar_valid          (iBusAxi_ar_valid),          //  output,   width = 1,           iBusaxi.arvalid
		.iBusAxi_ar_ready          (iBusAxi_ar_ready),          //   input,   width = 1,                  .arready
		.iBusAxi_ar_payload_addr   (iBusAxi_ar_payload_addr),   //  output,  width = 32,                  .araddr
		.iBusAxi_ar_payload_id     (iBusAxi_ar_payload_id),     //  output,   width = 1,                  .arid
		.iBusAxi_ar_payload_region (iBusAxi_ar_payload_region), //  output,   width = 4,                  .arregion
		.iBusAxi_ar_payload_len    (iBusAxi_ar_payload_len),    //  output,   width = 8,                  .arlen
		.iBusAxi_ar_payload_size   (iBusAxi_ar_payload_size),   //  output,   width = 3,                  .arsize
		.iBusAxi_ar_payload_burst  (iBusAxi_ar_payload_burst),  //  output,   width = 2,                  .arburst
		.iBusAxi_ar_payload_lock   (iBusAxi_ar_payload_lock),   //  output,   width = 1,                  .arlock
		.iBusAxi_ar_payload_cache  (iBusAxi_ar_payload_cache),  //  output,   width = 4,                  .arcache
		.iBusAxi_ar_payload_qos    (iBusAxi_ar_payload_qos),    //  output,   width = 4,                  .arqos
		.iBusAxi_ar_payload_prot   (iBusAxi_ar_payload_prot),   //  output,   width = 3,                  .arprot
		.iBusAxi_r_valid           (iBusAxi_r_valid),           //   input,   width = 1,                  .rvalid
		.iBusAxi_r_ready           (iBusAxi_r_ready),           //  output,   width = 1,                  .rready
		.iBusAxi_r_payload_data    (iBusAxi_r_payload_data),    //   input,  width = 32,                  .rdata
		.iBusAxi_r_payload_id      (iBusAxi_r_payload_id),      //   input,   width = 1,                  .rid
		.iBusAxi_r_payload_resp    (iBusAxi_r_payload_resp),    //   input,   width = 2,                  .rresp
		.iBusAxi_r_payload_last    (iBusAxi_r_payload_last),    //   input,   width = 1,                  .rlast
		.debugReset                (debugReset),                //   input,   width = 1,        debugReset.reset
		.debug_resetOut            (debug_resetOut),            //  output,   width = 1,    debug_resetOut.reset
		.externalInterrupt         (externalInterrupt),         //   input,   width = 1, externalInterrupt.irq
		.timerInterrupt            (timerInterrupt),            //   input,   width = 1,    timerInterrupt.irq
		.softwareInterrupt         (softwareInterrupt),         //   input,   width = 1, softwareInterrupt.export
		.jtag_tms                  (jtag_tms),                  //   input,   width = 1,              jtag.export
		.jtag_tdi                  (jtag_tdi),                  //   input,   width = 1,                  .export1
		.jtag_tdo                  (jtag_tdo),                  //  output,   width = 1,                  .export2
		.jtag_tck                  (jtag_tck)                   //   input,   width = 1,                  .export3
	);

endmodule