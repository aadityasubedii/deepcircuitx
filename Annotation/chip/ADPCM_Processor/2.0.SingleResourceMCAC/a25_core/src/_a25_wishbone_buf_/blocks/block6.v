always @(posedge reset, posedge clk) begin
	if (reset) begin
		wbuf_rp_r <= 'd0;
	end else begin
		if (pop) begin
			wbuf_rp_r <= !wbuf_rp_r;
		end
	end
end            