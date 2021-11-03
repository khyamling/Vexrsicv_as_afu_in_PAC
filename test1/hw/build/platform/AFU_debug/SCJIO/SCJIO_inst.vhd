	component SCJIO is
		generic (
			ENABLE_JTAG_IO_SELECTION : integer := 0;
			NEGEDGE_TDO_LATCH        : integer := 1
		);
		port (
			tms : in  std_logic := 'X'; -- tms
			tdi : in  std_logic := 'X'; -- tdi
			tdo : out std_logic;        -- tdo
			tck : in  std_logic := 'X'  -- clk
		);
	end component SCJIO;

	u0 : component SCJIO
		generic map (
			ENABLE_JTAG_IO_SELECTION => INTEGER_VALUE_FOR_ENABLE_JTAG_IO_SELECTION,
			NEGEDGE_TDO_LATCH        => INTEGER_VALUE_FOR_NEGEDGE_TDO_LATCH
		)
		port map (
			tms => CONNECTED_TO_tms, -- jtag.tms
			tdi => CONNECTED_TO_tdi, --     .tdi
			tdo => CONNECTED_TO_tdo, --     .tdo
			tck => CONNECTED_TO_tck  --  tck.clk
		);

