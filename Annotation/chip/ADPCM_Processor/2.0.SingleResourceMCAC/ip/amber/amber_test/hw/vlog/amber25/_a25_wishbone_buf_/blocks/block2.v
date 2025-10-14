always@(posedge reset, posedge clk) begin
	if (reset) begin
		busy_reading_r <= 'd0;
	end else begin
	    if (o_valid && !o_write)
		  busy_reading_r <= 1'd1;
	    else if (i_rdata_valid)
		  busy_reading_r <= 1'd0;
	end
end