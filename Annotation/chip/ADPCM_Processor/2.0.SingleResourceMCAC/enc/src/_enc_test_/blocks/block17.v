initial begin
    $timeformat(-9,2,"ns", 16);
`ifdef SDFSCAN
    $sdf_annotate("sdf/enc_tsmc065_scan.sdf", test.top);
`endif
	clk = 1'b0;
	enc_s = 1'b0;
	
	enc_s_fs = 1'b0;
	uart_clk = 1'b0;
	scan_in0 = 1'b0;
	scan_in1 = 1'b0;
	scan_in2 = 1'b0;
	scan_in3 = 1'b0;
	scan_in4 = 1'b0;
	scan_enable = 1'b0;
	test_mode = 1'b0;
	ch_count = 5'd0;
	bit_count = 3'd7;
	test_count = 'd0;
	next_channel = 'd0;


	tdmo_ch_count = 5'd0;
	tdmo_bit_count = 3'd7;
	tdmo_test_count = 'd0;

	reset = 1'd0;
	@(posedge clk)
		reset = #1 1'd1;
	repeat(`RESET_MEM_TICKS)
		@(negedge clk);
	reset = #1 1'd0;

	addrs = 7'h20;
	cs = 1'b1;
	rs = 1'b0;
	ws = 1'b0;
	w_data = 8'h00;

	
	
	model = 0;
	type = 0;
	operation = 0;
	law = 0;
	rate = 0;
	

	
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","vectorSize.t"}, vectorSizes);
	loop = vectorSizes[0];
`ifndef SINGLECHANNEL
	loop = loop / 32;
`endif
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","channel.t"}, channels);
	test_channel = channels[0];
	$display("Current channel being tested with main vectors is: %d", test_channel);
	$display("Other channels being tested with null vectors");           
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","input.t"}, data_in_vec);
	$readmemh({"../sw/mc_model/vector_out/",laws[law],"/", models[model], "/", types[type],"/", operations[operation],"/",rates[rate],"/","output.t"}, data_out_vec);

end