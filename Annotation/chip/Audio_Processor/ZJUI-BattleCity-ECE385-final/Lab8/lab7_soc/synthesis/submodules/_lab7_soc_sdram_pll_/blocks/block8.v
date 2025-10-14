	lab7_soc_sdram_pll_stdsync_sv6   stdsync2
	( 
	.clk(clk),
	.din(wire_sd1_locked),
	.dout(wire_stdsync2_dout),
	.reset_n((~ reset)));