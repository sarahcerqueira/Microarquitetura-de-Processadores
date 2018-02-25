	component projetoNiosQsys is
		port (
			botao_export    : in  std_logic                    := 'X';             -- export
			clk_clk         : in  std_logic                    := 'X';             -- clk
			display0_export : out std_logic_vector(7 downto 0);                    -- export
			display1_export : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n   : in  std_logic                    := 'X';             -- reset_n
			switchs_export  : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component projetoNiosQsys;

	u0 : component projetoNiosQsys
		port map (
			botao_export    => CONNECTED_TO_botao_export,    --    botao.export
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			display0_export => CONNECTED_TO_display0_export, -- display0.export
			display1_export => CONNECTED_TO_display1_export, -- display1.export
			reset_reset_n   => CONNECTED_TO_reset_reset_n,   --    reset.reset_n
			switchs_export  => CONNECTED_TO_switchs_export   --  switchs.export
		);

