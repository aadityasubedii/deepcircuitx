always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		wb_rdata_burst <= 'd0;
	end else begin
		if ( i_wb_cached_ready ) begin
			wb_rdata_burst <= i_wb_cached_rdata;
		end
	end
end