initial begin
	$timeformat(-9,2,"ns", 16);
	`ifdef SDFSCAN
		$sdf_annotate("sdf/boot_mem128_tsmc18_scan.sdf", test.top);
	`endif
	clk <= 1'b0;
	reset <= 1'b0;
	scan_in0 <= 1'b0;
	scan_in1 <= 1'b0;
	scan_in2 <= 1'b0;
	scan_in3 <= 1'b0;
	scan_in4 <= 1'b0;
	scan_enable <= 1'b0;
	test_mode <= 1'b0;

	i_wb_adr <= 'd0;
	i_wb_sel <= 16'h0000;
	i_wb_we  <= 1'b0;
	i_wb_dat <= 'd0;
	i_wb_cyc <= 1'b0;
	i_wb_stb <= 1'b0;

	@(posedge clk) begin
		reset <= 1'b1;
	end

	@(posedge clk);
	
	@(negedge clk) begin
		reset <= 1'b0;
	end

	for (i=0; i<1024; i=i+1) begin
		i_wb_sel <= 16'hFFFF;
		wb_write_strobe({18'h00000, i[9:0], 4'h0}, i);
	end
	for (i=0; i<1024; i=i+1) begin
		i_wb_sel <= 16'hFFFF;
		wb_read_strobe({18'h00000, i[9:0], 4'h0}, 0, 0);
	end

    $finish;
end