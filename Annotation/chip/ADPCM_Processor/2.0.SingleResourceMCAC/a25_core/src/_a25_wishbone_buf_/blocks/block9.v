always @(posedge reset, posedge clk) begin
	if (reset) begin
		wbuf_used_r <= 'd0;
	end else begin
		if (push && pop)
			wbuf_used_r     <= wbuf_used_r;
		else if (push)
			wbuf_used_r     <= wbuf_used_r + 1'd1;
		else if (pop)
			wbuf_used_r     <= wbuf_used_r - 1'd1;
	end
end