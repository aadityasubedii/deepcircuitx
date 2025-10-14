always @( posedge reset, posedge clk ) begin
	if (reset) begin
		test_status_set <= 'd0;
	end else begin
	    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_STATUS )
		  test_status_set <= 1'd1;
	end
end