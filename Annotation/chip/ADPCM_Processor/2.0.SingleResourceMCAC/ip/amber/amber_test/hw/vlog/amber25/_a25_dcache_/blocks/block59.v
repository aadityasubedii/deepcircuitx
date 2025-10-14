always @(posedge reset, posedge clk) begin
	if (reset) begin
		wb_address 	<= 'd0;
	end else begin
		if ( o_wb_cached_req ) begin
			wb_address <= i_address;
		end else if ( i_wb_cached_ready && fill_state ) begin
			wb_address <= {wb_address[31:4], wb_address[3:2] + 1'd1, 2'd0};
		end
	end
end