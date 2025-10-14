always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		data_hit_way_r <= 'd0;
	end else begin
		if ( write_hit ) begin
			data_hit_way_r      <= data_hit_way;
		end
	end
end