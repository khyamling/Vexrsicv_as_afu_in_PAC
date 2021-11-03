	component bram_ram_1port_0 is
		port (
			data    : in  std_logic_vector(63 downto 0) := (others => 'X'); -- datain
			q       : out std_logic_vector(63 downto 0);                    -- dataout
			address : in  std_logic_vector(8 downto 0)  := (others => 'X'); -- address
			wren    : in  std_logic                     := 'X';             -- wren
			clock   : in  std_logic                     := 'X'              -- clk
		);
	end component bram_ram_1port_0;

	u0 : component bram_ram_1port_0
		port map (
			data    => CONNECTED_TO_data,    --    data.datain
			q       => CONNECTED_TO_q,       --       q.dataout
			address => CONNECTED_TO_address, -- address.address
			wren    => CONNECTED_TO_wren,    --    wren.wren
			clock   => CONNECTED_TO_clock    --   clock.clk
		);

