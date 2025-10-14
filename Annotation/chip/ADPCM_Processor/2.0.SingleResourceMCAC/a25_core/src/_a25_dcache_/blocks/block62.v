always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		data_wdata_r <= 'd0;
	end else begin
		if ( write_hit || consecutive_write ) begin
			data_wdata_r   <= data_wdata;
		end
	end
end