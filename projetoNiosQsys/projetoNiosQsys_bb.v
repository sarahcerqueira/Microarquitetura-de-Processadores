
module projetoNiosQsys (
	botao_export,
	clk_clk,
	display0_export,
	display1_export,
	reset_reset_n,
	switchs_export);	

	input		botao_export;
	input		clk_clk;
	output	[7:0]	display0_export;
	output	[7:0]	display1_export;
	input		reset_reset_n;
	input	[7:0]	switchs_export;
endmodule
