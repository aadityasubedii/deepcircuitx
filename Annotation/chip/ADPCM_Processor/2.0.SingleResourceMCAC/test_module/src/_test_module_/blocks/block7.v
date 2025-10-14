always @( posedge reset, posedge clk ) begin
	if (reset) begin
		test_status_reg <= 'd0;
	end else begin
		if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_STATUS )
			test_status_reg <= wb_wdata32;
	end
end