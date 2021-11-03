	component bram_VexRiscvAxi4_0 is
		port (
			clk                       : in  std_logic                     := 'X';             -- clk
			reset                     : in  std_logic                     := 'X';             -- reset
			dBusAxi_aw_valid          : out std_logic;                                        -- awvalid
			dBusAxi_aw_ready          : in  std_logic                     := 'X';             -- awready
			dBusAxi_aw_payload_addr   : out std_logic_vector(31 downto 0);                    -- awaddr
			dBusAxi_aw_payload_id     : out std_logic;                                        -- awid
			dBusAxi_aw_payload_region : out std_logic_vector(3 downto 0);                     -- awregion
			dBusAxi_aw_payload_len    : out std_logic_vector(7 downto 0);                     -- awlen
			dBusAxi_aw_payload_size   : out std_logic_vector(2 downto 0);                     -- awsize
			dBusAxi_aw_payload_burst  : out std_logic_vector(1 downto 0);                     -- awburst
			dBusAxi_aw_payload_lock   : out std_logic;                                        -- awlock
			dBusAxi_aw_payload_cache  : out std_logic_vector(3 downto 0);                     -- awcache
			dBusAxi_aw_payload_qos    : out std_logic_vector(3 downto 0);                     -- awqos
			dBusAxi_aw_payload_prot   : out std_logic_vector(2 downto 0);                     -- awprot
			dBusAxi_w_valid           : out std_logic;                                        -- wvalid
			dBusAxi_w_ready           : in  std_logic                     := 'X';             -- wready
			dBusAxi_w_payload_data    : out std_logic_vector(31 downto 0);                    -- wdata
			dBusAxi_w_payload_strb    : out std_logic_vector(3 downto 0);                     -- wstrb
			dBusAxi_w_payload_last    : out std_logic;                                        -- wlast
			dBusAxi_b_valid           : in  std_logic                     := 'X';             -- bvalid
			dBusAxi_b_ready           : out std_logic;                                        -- bready
			dBusAxi_b_payload_id      : in  std_logic                     := 'X';             -- bid
			dBusAxi_b_payload_resp    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			dBusAxi_ar_valid          : out std_logic;                                        -- arvalid
			dBusAxi_ar_ready          : in  std_logic                     := 'X';             -- arready
			dBusAxi_ar_payload_addr   : out std_logic_vector(31 downto 0);                    -- araddr
			dBusAxi_ar_payload_id     : out std_logic;                                        -- arid
			dBusAxi_ar_payload_region : out std_logic_vector(3 downto 0);                     -- arregion
			dBusAxi_ar_payload_len    : out std_logic_vector(7 downto 0);                     -- arlen
			dBusAxi_ar_payload_size   : out std_logic_vector(2 downto 0);                     -- arsize
			dBusAxi_ar_payload_burst  : out std_logic_vector(1 downto 0);                     -- arburst
			dBusAxi_ar_payload_lock   : out std_logic;                                        -- arlock
			dBusAxi_ar_payload_cache  : out std_logic_vector(3 downto 0);                     -- arcache
			dBusAxi_ar_payload_qos    : out std_logic_vector(3 downto 0);                     -- arqos
			dBusAxi_ar_payload_prot   : out std_logic_vector(2 downto 0);                     -- arprot
			dBusAxi_r_valid           : in  std_logic                     := 'X';             -- rvalid
			dBusAxi_r_ready           : out std_logic;                                        -- rready
			dBusAxi_r_payload_data    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			dBusAxi_r_payload_id      : in  std_logic                     := 'X';             -- rid
			dBusAxi_r_payload_resp    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			dBusAxi_r_payload_last    : in  std_logic                     := 'X';             -- rlast
			iBusAxi_ar_valid          : out std_logic;                                        -- arvalid
			iBusAxi_ar_ready          : in  std_logic                     := 'X';             -- arready
			iBusAxi_ar_payload_addr   : out std_logic_vector(31 downto 0);                    -- araddr
			iBusAxi_ar_payload_id     : out std_logic;                                        -- arid
			iBusAxi_ar_payload_region : out std_logic_vector(3 downto 0);                     -- arregion
			iBusAxi_ar_payload_len    : out std_logic_vector(7 downto 0);                     -- arlen
			iBusAxi_ar_payload_size   : out std_logic_vector(2 downto 0);                     -- arsize
			iBusAxi_ar_payload_burst  : out std_logic_vector(1 downto 0);                     -- arburst
			iBusAxi_ar_payload_lock   : out std_logic;                                        -- arlock
			iBusAxi_ar_payload_cache  : out std_logic_vector(3 downto 0);                     -- arcache
			iBusAxi_ar_payload_qos    : out std_logic_vector(3 downto 0);                     -- arqos
			iBusAxi_ar_payload_prot   : out std_logic_vector(2 downto 0);                     -- arprot
			iBusAxi_r_valid           : in  std_logic                     := 'X';             -- rvalid
			iBusAxi_r_ready           : out std_logic;                                        -- rready
			iBusAxi_r_payload_data    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			iBusAxi_r_payload_id      : in  std_logic                     := 'X';             -- rid
			iBusAxi_r_payload_resp    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			iBusAxi_r_payload_last    : in  std_logic                     := 'X';             -- rlast
			iBusaxi_awaddr            : out std_logic_vector(31 downto 0);                    -- awaddr
			iBusaxi_awprot            : out std_logic_vector(2 downto 0);                     -- awprot
			iBusaxi_awlock            : out std_logic;                                        -- awlock
			iBusaxi_awvalid           : out std_logic;                                        -- awvalid
			iBusaxi_awready           : in  std_logic                     := 'X';             -- awready
			iBusaxi_wdata             : out std_logic_vector(31 downto 0);                    -- wdata
			iBusaxi_wlast             : out std_logic;                                        -- wlast
			iBusaxi_wready            : in  std_logic                     := 'X';             -- wready
			iBusaxi_wvalid            : out std_logic;                                        -- wvalid
			iBusaxi_bvalid            : in  std_logic                     := 'X';             -- bvalid
			iBusaxi_bready            : out std_logic;                                        -- bready
			iBusaxi_bid               : in  std_logic                     := 'X';             -- bid
			iBusaxi_awid              : out std_logic;                                        -- awid
			debugReset                : in  std_logic                     := 'X';             -- reset
			debug_resetOut            : out std_logic;                                        -- reset
			externalInterrupt         : in  std_logic                     := 'X';             -- irq
			timerInterrupt            : in  std_logic                     := 'X';             -- irq
			softwareInterrupt         : in  std_logic                     := 'X';             -- export
			jtag_tms                  : in  std_logic                     := 'X';             -- export
			jtag_tdi                  : in  std_logic                     := 'X';             -- export1
			jtag_tdo                  : out std_logic;                                        -- export2
			jtag_tck                  : in  std_logic                     := 'X'              -- export3
		);
	end component bram_VexRiscvAxi4_0;

	u0 : component bram_VexRiscvAxi4_0
		port map (
			clk                       => CONNECTED_TO_clk,                       --             clock.clk
			reset                     => CONNECTED_TO_reset,                     --             reset.reset
			dBusAxi_aw_valid          => CONNECTED_TO_dBusAxi_aw_valid,          --           dBusaxi.awvalid
			dBusAxi_aw_ready          => CONNECTED_TO_dBusAxi_aw_ready,          --                  .awready
			dBusAxi_aw_payload_addr   => CONNECTED_TO_dBusAxi_aw_payload_addr,   --                  .awaddr
			dBusAxi_aw_payload_id     => CONNECTED_TO_dBusAxi_aw_payload_id,     --                  .awid
			dBusAxi_aw_payload_region => CONNECTED_TO_dBusAxi_aw_payload_region, --                  .awregion
			dBusAxi_aw_payload_len    => CONNECTED_TO_dBusAxi_aw_payload_len,    --                  .awlen
			dBusAxi_aw_payload_size   => CONNECTED_TO_dBusAxi_aw_payload_size,   --                  .awsize
			dBusAxi_aw_payload_burst  => CONNECTED_TO_dBusAxi_aw_payload_burst,  --                  .awburst
			dBusAxi_aw_payload_lock   => CONNECTED_TO_dBusAxi_aw_payload_lock,   --                  .awlock
			dBusAxi_aw_payload_cache  => CONNECTED_TO_dBusAxi_aw_payload_cache,  --                  .awcache
			dBusAxi_aw_payload_qos    => CONNECTED_TO_dBusAxi_aw_payload_qos,    --                  .awqos
			dBusAxi_aw_payload_prot   => CONNECTED_TO_dBusAxi_aw_payload_prot,   --                  .awprot
			dBusAxi_w_valid           => CONNECTED_TO_dBusAxi_w_valid,           --                  .wvalid
			dBusAxi_w_ready           => CONNECTED_TO_dBusAxi_w_ready,           --                  .wready
			dBusAxi_w_payload_data    => CONNECTED_TO_dBusAxi_w_payload_data,    --                  .wdata
			dBusAxi_w_payload_strb    => CONNECTED_TO_dBusAxi_w_payload_strb,    --                  .wstrb
			dBusAxi_w_payload_last    => CONNECTED_TO_dBusAxi_w_payload_last,    --                  .wlast
			dBusAxi_b_valid           => CONNECTED_TO_dBusAxi_b_valid,           --                  .bvalid
			dBusAxi_b_ready           => CONNECTED_TO_dBusAxi_b_ready,           --                  .bready
			dBusAxi_b_payload_id      => CONNECTED_TO_dBusAxi_b_payload_id,      --                  .bid
			dBusAxi_b_payload_resp    => CONNECTED_TO_dBusAxi_b_payload_resp,    --                  .bresp
			dBusAxi_ar_valid          => CONNECTED_TO_dBusAxi_ar_valid,          --                  .arvalid
			dBusAxi_ar_ready          => CONNECTED_TO_dBusAxi_ar_ready,          --                  .arready
			dBusAxi_ar_payload_addr   => CONNECTED_TO_dBusAxi_ar_payload_addr,   --                  .araddr
			dBusAxi_ar_payload_id     => CONNECTED_TO_dBusAxi_ar_payload_id,     --                  .arid
			dBusAxi_ar_payload_region => CONNECTED_TO_dBusAxi_ar_payload_region, --                  .arregion
			dBusAxi_ar_payload_len    => CONNECTED_TO_dBusAxi_ar_payload_len,    --                  .arlen
			dBusAxi_ar_payload_size   => CONNECTED_TO_dBusAxi_ar_payload_size,   --                  .arsize
			dBusAxi_ar_payload_burst  => CONNECTED_TO_dBusAxi_ar_payload_burst,  --                  .arburst
			dBusAxi_ar_payload_lock   => CONNECTED_TO_dBusAxi_ar_payload_lock,   --                  .arlock
			dBusAxi_ar_payload_cache  => CONNECTED_TO_dBusAxi_ar_payload_cache,  --                  .arcache
			dBusAxi_ar_payload_qos    => CONNECTED_TO_dBusAxi_ar_payload_qos,    --                  .arqos
			dBusAxi_ar_payload_prot   => CONNECTED_TO_dBusAxi_ar_payload_prot,   --                  .arprot
			dBusAxi_r_valid           => CONNECTED_TO_dBusAxi_r_valid,           --                  .rvalid
			dBusAxi_r_ready           => CONNECTED_TO_dBusAxi_r_ready,           --                  .rready
			dBusAxi_r_payload_data    => CONNECTED_TO_dBusAxi_r_payload_data,    --                  .rdata
			dBusAxi_r_payload_id      => CONNECTED_TO_dBusAxi_r_payload_id,      --                  .rid
			dBusAxi_r_payload_resp    => CONNECTED_TO_dBusAxi_r_payload_resp,    --                  .rresp
			dBusAxi_r_payload_last    => CONNECTED_TO_dBusAxi_r_payload_last,    --                  .rlast
			iBusAxi_ar_valid          => CONNECTED_TO_iBusAxi_ar_valid,          --           iBusaxi.arvalid
			iBusAxi_ar_ready          => CONNECTED_TO_iBusAxi_ar_ready,          --                  .arready
			iBusAxi_ar_payload_addr   => CONNECTED_TO_iBusAxi_ar_payload_addr,   --                  .araddr
			iBusAxi_ar_payload_id     => CONNECTED_TO_iBusAxi_ar_payload_id,     --                  .arid
			iBusAxi_ar_payload_region => CONNECTED_TO_iBusAxi_ar_payload_region, --                  .arregion
			iBusAxi_ar_payload_len    => CONNECTED_TO_iBusAxi_ar_payload_len,    --                  .arlen
			iBusAxi_ar_payload_size   => CONNECTED_TO_iBusAxi_ar_payload_size,   --                  .arsize
			iBusAxi_ar_payload_burst  => CONNECTED_TO_iBusAxi_ar_payload_burst,  --                  .arburst
			iBusAxi_ar_payload_lock   => CONNECTED_TO_iBusAxi_ar_payload_lock,   --                  .arlock
			iBusAxi_ar_payload_cache  => CONNECTED_TO_iBusAxi_ar_payload_cache,  --                  .arcache
			iBusAxi_ar_payload_qos    => CONNECTED_TO_iBusAxi_ar_payload_qos,    --                  .arqos
			iBusAxi_ar_payload_prot   => CONNECTED_TO_iBusAxi_ar_payload_prot,   --                  .arprot
			iBusAxi_r_valid           => CONNECTED_TO_iBusAxi_r_valid,           --                  .rvalid
			iBusAxi_r_ready           => CONNECTED_TO_iBusAxi_r_ready,           --                  .rready
			iBusAxi_r_payload_data    => CONNECTED_TO_iBusAxi_r_payload_data,    --                  .rdata
			iBusAxi_r_payload_id      => CONNECTED_TO_iBusAxi_r_payload_id,      --                  .rid
			iBusAxi_r_payload_resp    => CONNECTED_TO_iBusAxi_r_payload_resp,    --                  .rresp
			iBusAxi_r_payload_last    => CONNECTED_TO_iBusAxi_r_payload_last,    --                  .rlast
			iBusaxi_awaddr            => CONNECTED_TO_iBusaxi_awaddr,            --                  .awaddr
			iBusaxi_awprot            => CONNECTED_TO_iBusaxi_awprot,            --                  .awprot
			iBusaxi_awlock            => CONNECTED_TO_iBusaxi_awlock,            --                  .awlock
			iBusaxi_awvalid           => CONNECTED_TO_iBusaxi_awvalid,           --                  .awvalid
			iBusaxi_awready           => CONNECTED_TO_iBusaxi_awready,           --                  .awready
			iBusaxi_wdata             => CONNECTED_TO_iBusaxi_wdata,             --                  .wdata
			iBusaxi_wlast             => CONNECTED_TO_iBusaxi_wlast,             --                  .wlast
			iBusaxi_wready            => CONNECTED_TO_iBusaxi_wready,            --                  .wready
			iBusaxi_wvalid            => CONNECTED_TO_iBusaxi_wvalid,            --                  .wvalid
			iBusaxi_bvalid            => CONNECTED_TO_iBusaxi_bvalid,            --                  .bvalid
			iBusaxi_bready            => CONNECTED_TO_iBusaxi_bready,            --                  .bready
			iBusaxi_bid               => CONNECTED_TO_iBusaxi_bid,               --                  .bid
			iBusaxi_awid              => CONNECTED_TO_iBusaxi_awid,              --                  .awid
			debugReset                => CONNECTED_TO_debugReset,                --        debugReset.reset
			debug_resetOut            => CONNECTED_TO_debug_resetOut,            --    debug_resetOut.reset
			externalInterrupt         => CONNECTED_TO_externalInterrupt,         -- externalInterrupt.irq
			timerInterrupt            => CONNECTED_TO_timerInterrupt,            --    timerInterrupt.irq
			softwareInterrupt         => CONNECTED_TO_softwareInterrupt,         -- softwareInterrupt.export
			jtag_tms                  => CONNECTED_TO_jtag_tms,                  --              jtag.export
			jtag_tdi                  => CONNECTED_TO_jtag_tdi,                  --                  .export1
			jtag_tdo                  => CONNECTED_TO_jtag_tdo,                  --                  .export2
			jtag_tck                  => CONNECTED_TO_jtag_tck                   --                  .export3
		);

