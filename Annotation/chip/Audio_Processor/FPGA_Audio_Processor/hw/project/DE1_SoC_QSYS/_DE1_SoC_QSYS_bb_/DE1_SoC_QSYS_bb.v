
module DE1_SoC_QSYS (
	clk_clk,
	clk_sdram_clk,
	data_in_export,
	data_out_export,
	key_external_connection_export,
	pll_locked_export,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	sync_in_export,
	play_btn_in_export,
	record_btn_in_export);	

	input		clk_clk;
	output		clk_sdram_clk;
	input	[15:0]	data_in_export;
	output	[15:0]	data_out_export;
	input	[3:0]	key_external_connection_export;
	output		pll_locked_export;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		sync_in_export;
	input		play_btn_in_export;
	input		record_btn_in_export;
endmodule
