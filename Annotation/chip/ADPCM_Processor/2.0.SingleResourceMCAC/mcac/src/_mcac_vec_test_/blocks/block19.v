initial begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/mcac_tsmc065_scan.sdf", test.top);
`endif
	clk = 1'b0;
	enc_s = 1'b0;
	dec_i = 1'b0;
	enc_s_fs = 1'b0;
	dec_i_fs = 1'b0;
	uart_clk = 1'b0;
	scan_in0 = 1'b0;
	scan_in1 = 1'b0;
	scan_in2 = 1'b0;
	scan_in3 = 1'b0;
	scan_in4 = 1'b0;
	scan_enable = 1'b0;
	test_mode = 1'b0;

	reset = 1'd0;
	@(posedge clk)
		reset = #1 1'd1;
	repeat(`RESET_MEM_TICKS)
		@(negedge clk);
	reset = #1 1'd0;

	addrs = 7'h00;
	cs = 1'b1;
	rs = 1'b0;
	ws = 1'b0;
	w_data = 8'h00;

`ifdef STANDALONE
	model = 0;
	type = 0;
	operation= 0;
	law = 2;
	rate = 0;
`else
	
	$readmemh({"./MCACTests.t"},testCases);
	model = testCases[0];
	type = testCases[1];
	operation = testCases[2];
	law = testCases[3];
	rate = testCases[4];
`endif
	$display("MCAC %s %s %s %s law", rates[rate], operations[operation], types[type], laws[law]);

	
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[0], "/", types[type],"/", operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes_e);
	loop_e = vectorSizes_e[0];
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[1], "/", types[type],"/", operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes_d);
	loop_d = vectorSizes_d[0];
`ifndef SINGLECHANNEL
	loop_e = loop_e / 32;
	loop_d = loop_d / 32;
`endif
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[0], "/", types[type],"/", operations[operation],"/",rates[rate],"/","channel.t"}, channels_e);
	test_channel_e = channels_e[0];
	$display("Current channel being tested with main vectors is: %d", test_channel_e);
	$display("Other channels being tested with null vectors");
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[0], "/", types[type],"/", operations[operation],"/",rates[rate],"/","input.t"}, data_in_vec_e);
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[0], "/", types[type],"/", operations[operation],"/",rates[rate],"/","output.t"}, data_out_vec_e);

	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[1], "/", types[type],"/", operations[operation],"/",rates[rate],"/","channel.t"}, channels_d);
	test_channel_d = channels_d[0];
	$display("Current channel being tested with main vectors is: %d", test_channel_d);
	$display("Other channels being tested with null vectors");           
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[1], "/", types[type],"/", operations[operation],"/",rates[rate],"/","input.t"}, data_in_vec_d);
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[1], "/", types[type],"/", operations[operation],"/",rates[rate],"/","output.t"}, data_out_vec_d);

end