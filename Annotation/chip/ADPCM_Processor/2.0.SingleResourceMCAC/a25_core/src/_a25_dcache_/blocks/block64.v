always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		miss_address <= 'd0;
	end else begin
		if ( o_wb_cached_req || write_hit ) begin
			miss_address <= i_address;
		end
	end
end