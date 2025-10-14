module  lab7_soc_sdram_pll_stdsync_sv6
	( 
	clk,
	din,
	dout,
	reset_n) ;
	input   clk;
	input   din;
	output   dout;
	input   reset_n;

	wire  [0:0]   wire_dffpipe3_q;

	lab7_soc_sdram_pll_dffpipe_l2c   dffpipe3
	( 
	.clock(clk),
	.clrn(reset_n),
	.d(din),
	.q(wire_dffpipe3_q));
	assign
		dout = wire_dffpipe3_q;
endmodule 