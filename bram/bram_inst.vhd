	component bram is
		port (
			clk_clk                  : in  std_logic                     := 'X';             -- clk
			onchip_memory_address    : in  std_logic_vector(9 downto 0)  := (others => 'X'); -- address
			onchip_memory_chipselect : in  std_logic                     := 'X';             -- chipselect
			onchip_memory_clken      : in  std_logic                     := 'X';             -- clken
			onchip_memory_write      : in  std_logic                     := 'X';             -- write
			onchip_memory_readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			onchip_memory_writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			onchip_memory_byteenable : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			reset_reset_n            : in  std_logic                     := 'X'              -- reset_n
		);
	end component bram;

	u0 : component bram
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --           clk.clk
			onchip_memory_address    => CONNECTED_TO_onchip_memory_address,    -- onchip_memory.address
			onchip_memory_chipselect => CONNECTED_TO_onchip_memory_chipselect, --              .chipselect
			onchip_memory_clken      => CONNECTED_TO_onchip_memory_clken,      --              .clken
			onchip_memory_write      => CONNECTED_TO_onchip_memory_write,      --              .write
			onchip_memory_readdata   => CONNECTED_TO_onchip_memory_readdata,   --              .readdata
			onchip_memory_writedata  => CONNECTED_TO_onchip_memory_writedata,  --              .writedata
			onchip_memory_byteenable => CONNECTED_TO_onchip_memory_byteenable, --              .byteenable
			reset_reset_n            => CONNECTED_TO_reset_reset_n             --         reset.reset_n
		);

