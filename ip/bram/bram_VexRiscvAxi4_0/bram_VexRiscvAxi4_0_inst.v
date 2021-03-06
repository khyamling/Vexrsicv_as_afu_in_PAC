	bram_VexRiscvAxi4_0 u0 (
		.clk                       (_connected_to_clk_),                       //   input,   width = 1,             clock.clk
		.reset                     (_connected_to_reset_),                     //   input,   width = 1,             reset.reset
		.dBusAxi_aw_valid          (_connected_to_dBusAxi_aw_valid_),          //  output,   width = 1,           dBusaxi.awvalid
		.dBusAxi_aw_ready          (_connected_to_dBusAxi_aw_ready_),          //   input,   width = 1,                  .awready
		.dBusAxi_aw_payload_addr   (_connected_to_dBusAxi_aw_payload_addr_),   //  output,  width = 32,                  .awaddr
		.dBusAxi_aw_payload_id     (_connected_to_dBusAxi_aw_payload_id_),     //  output,   width = 1,                  .awid
		.dBusAxi_aw_payload_region (_connected_to_dBusAxi_aw_payload_region_), //  output,   width = 4,                  .awregion
		.dBusAxi_aw_payload_len    (_connected_to_dBusAxi_aw_payload_len_),    //  output,   width = 8,                  .awlen
		.dBusAxi_aw_payload_size   (_connected_to_dBusAxi_aw_payload_size_),   //  output,   width = 3,                  .awsize
		.dBusAxi_aw_payload_burst  (_connected_to_dBusAxi_aw_payload_burst_),  //  output,   width = 2,                  .awburst
		.dBusAxi_aw_payload_lock   (_connected_to_dBusAxi_aw_payload_lock_),   //  output,   width = 1,                  .awlock
		.dBusAxi_aw_payload_cache  (_connected_to_dBusAxi_aw_payload_cache_),  //  output,   width = 4,                  .awcache
		.dBusAxi_aw_payload_qos    (_connected_to_dBusAxi_aw_payload_qos_),    //  output,   width = 4,                  .awqos
		.dBusAxi_aw_payload_prot   (_connected_to_dBusAxi_aw_payload_prot_),   //  output,   width = 3,                  .awprot
		.dBusAxi_w_valid           (_connected_to_dBusAxi_w_valid_),           //  output,   width = 1,                  .wvalid
		.dBusAxi_w_ready           (_connected_to_dBusAxi_w_ready_),           //   input,   width = 1,                  .wready
		.dBusAxi_w_payload_data    (_connected_to_dBusAxi_w_payload_data_),    //  output,  width = 32,                  .wdata
		.dBusAxi_w_payload_strb    (_connected_to_dBusAxi_w_payload_strb_),    //  output,   width = 4,                  .wstrb
		.dBusAxi_w_payload_last    (_connected_to_dBusAxi_w_payload_last_),    //  output,   width = 1,                  .wlast
		.dBusAxi_b_valid           (_connected_to_dBusAxi_b_valid_),           //   input,   width = 1,                  .bvalid
		.dBusAxi_b_ready           (_connected_to_dBusAxi_b_ready_),           //  output,   width = 1,                  .bready
		.dBusAxi_b_payload_id      (_connected_to_dBusAxi_b_payload_id_),      //   input,   width = 1,                  .bid
		.dBusAxi_b_payload_resp    (_connected_to_dBusAxi_b_payload_resp_),    //   input,   width = 2,                  .bresp
		.dBusAxi_ar_valid          (_connected_to_dBusAxi_ar_valid_),          //  output,   width = 1,                  .arvalid
		.dBusAxi_ar_ready          (_connected_to_dBusAxi_ar_ready_),          //   input,   width = 1,                  .arready
		.dBusAxi_ar_payload_addr   (_connected_to_dBusAxi_ar_payload_addr_),   //  output,  width = 32,                  .araddr
		.dBusAxi_ar_payload_id     (_connected_to_dBusAxi_ar_payload_id_),     //  output,   width = 1,                  .arid
		.dBusAxi_ar_payload_region (_connected_to_dBusAxi_ar_payload_region_), //  output,   width = 4,                  .arregion
		.dBusAxi_ar_payload_len    (_connected_to_dBusAxi_ar_payload_len_),    //  output,   width = 8,                  .arlen
		.dBusAxi_ar_payload_size   (_connected_to_dBusAxi_ar_payload_size_),   //  output,   width = 3,                  .arsize
		.dBusAxi_ar_payload_burst  (_connected_to_dBusAxi_ar_payload_burst_),  //  output,   width = 2,                  .arburst
		.dBusAxi_ar_payload_lock   (_connected_to_dBusAxi_ar_payload_lock_),   //  output,   width = 1,                  .arlock
		.dBusAxi_ar_payload_cache  (_connected_to_dBusAxi_ar_payload_cache_),  //  output,   width = 4,                  .arcache
		.dBusAxi_ar_payload_qos    (_connected_to_dBusAxi_ar_payload_qos_),    //  output,   width = 4,                  .arqos
		.dBusAxi_ar_payload_prot   (_connected_to_dBusAxi_ar_payload_prot_),   //  output,   width = 3,                  .arprot
		.dBusAxi_r_valid           (_connected_to_dBusAxi_r_valid_),           //   input,   width = 1,                  .rvalid
		.dBusAxi_r_ready           (_connected_to_dBusAxi_r_ready_),           //  output,   width = 1,                  .rready
		.dBusAxi_r_payload_data    (_connected_to_dBusAxi_r_payload_data_),    //   input,  width = 32,                  .rdata
		.dBusAxi_r_payload_id      (_connected_to_dBusAxi_r_payload_id_),      //   input,   width = 1,                  .rid
		.dBusAxi_r_payload_resp    (_connected_to_dBusAxi_r_payload_resp_),    //   input,   width = 2,                  .rresp
		.dBusAxi_r_payload_last    (_connected_to_dBusAxi_r_payload_last_),    //   input,   width = 1,                  .rlast
		.iBusAxi_ar_valid          (_connected_to_iBusAxi_ar_valid_),          //  output,   width = 1,           iBusaxi.arvalid
		.iBusAxi_ar_ready          (_connected_to_iBusAxi_ar_ready_),          //   input,   width = 1,                  .arready
		.iBusAxi_ar_payload_addr   (_connected_to_iBusAxi_ar_payload_addr_),   //  output,  width = 32,                  .araddr
		.iBusAxi_ar_payload_id     (_connected_to_iBusAxi_ar_payload_id_),     //  output,   width = 1,                  .arid
		.iBusAxi_ar_payload_region (_connected_to_iBusAxi_ar_payload_region_), //  output,   width = 4,                  .arregion
		.iBusAxi_ar_payload_len    (_connected_to_iBusAxi_ar_payload_len_),    //  output,   width = 8,                  .arlen
		.iBusAxi_ar_payload_size   (_connected_to_iBusAxi_ar_payload_size_),   //  output,   width = 3,                  .arsize
		.iBusAxi_ar_payload_burst  (_connected_to_iBusAxi_ar_payload_burst_),  //  output,   width = 2,                  .arburst
		.iBusAxi_ar_payload_lock   (_connected_to_iBusAxi_ar_payload_lock_),   //  output,   width = 1,                  .arlock
		.iBusAxi_ar_payload_cache  (_connected_to_iBusAxi_ar_payload_cache_),  //  output,   width = 4,                  .arcache
		.iBusAxi_ar_payload_qos    (_connected_to_iBusAxi_ar_payload_qos_),    //  output,   width = 4,                  .arqos
		.iBusAxi_ar_payload_prot   (_connected_to_iBusAxi_ar_payload_prot_),   //  output,   width = 3,                  .arprot
		.iBusAxi_r_valid           (_connected_to_iBusAxi_r_valid_),           //   input,   width = 1,                  .rvalid
		.iBusAxi_r_ready           (_connected_to_iBusAxi_r_ready_),           //  output,   width = 1,                  .rready
		.iBusAxi_r_payload_data    (_connected_to_iBusAxi_r_payload_data_),    //   input,  width = 32,                  .rdata
		.iBusAxi_r_payload_id      (_connected_to_iBusAxi_r_payload_id_),      //   input,   width = 1,                  .rid
		.iBusAxi_r_payload_resp    (_connected_to_iBusAxi_r_payload_resp_),    //   input,   width = 2,                  .rresp
		.iBusAxi_r_payload_last    (_connected_to_iBusAxi_r_payload_last_),    //   input,   width = 1,                  .rlast
		.iBusaxi_awaddr            (_connected_to_iBusaxi_awaddr_),            //  output,  width = 32,                  .awaddr
		.iBusaxi_awprot            (_connected_to_iBusaxi_awprot_),            //  output,   width = 3,                  .awprot
		.iBusaxi_awlock            (_connected_to_iBusaxi_awlock_),            //  output,   width = 1,                  .awlock
		.iBusaxi_awvalid           (_connected_to_iBusaxi_awvalid_),           //  output,   width = 1,                  .awvalid
		.iBusaxi_awready           (_connected_to_iBusaxi_awready_),           //   input,   width = 1,                  .awready
		.iBusaxi_wdata             (_connected_to_iBusaxi_wdata_),             //  output,  width = 32,                  .wdata
		.iBusaxi_wlast             (_connected_to_iBusaxi_wlast_),             //  output,   width = 1,                  .wlast
		.iBusaxi_wready            (_connected_to_iBusaxi_wready_),            //   input,   width = 1,                  .wready
		.iBusaxi_wvalid            (_connected_to_iBusaxi_wvalid_),            //  output,   width = 1,                  .wvalid
		.iBusaxi_bvalid            (_connected_to_iBusaxi_bvalid_),            //   input,   width = 1,                  .bvalid
		.iBusaxi_bready            (_connected_to_iBusaxi_bready_),            //  output,   width = 1,                  .bready
		.iBusaxi_bid               (_connected_to_iBusaxi_bid_),               //   input,   width = 1,                  .bid
		.iBusaxi_awid              (_connected_to_iBusaxi_awid_),              //  output,   width = 1,                  .awid
		.debugReset                (_connected_to_debugReset_),                //   input,   width = 1,        debugReset.reset
		.debug_resetOut            (_connected_to_debug_resetOut_),            //  output,   width = 1,    debug_resetOut.reset
		.externalInterrupt         (_connected_to_externalInterrupt_),         //   input,   width = 1, externalInterrupt.irq
		.timerInterrupt            (_connected_to_timerInterrupt_),            //   input,   width = 1,    timerInterrupt.irq
		.softwareInterrupt         (_connected_to_softwareInterrupt_),         //   input,   width = 1, softwareInterrupt.export
		.jtag_tms                  (_connected_to_jtag_tms_),                  //   input,   width = 1,              jtag.export
		.jtag_tdi                  (_connected_to_jtag_tdi_),                  //   input,   width = 1,                  .export1
		.jtag_tdo                  (_connected_to_jtag_tdo_),                  //  output,   width = 1,                  .export2
		.jtag_tck                  (_connected_to_jtag_tck_)                   //   input,   width = 1,                  .export3
	);

