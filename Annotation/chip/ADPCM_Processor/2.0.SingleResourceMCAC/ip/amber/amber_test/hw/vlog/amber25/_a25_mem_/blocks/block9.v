always @( posedge reset, posedge clk ) begin
	if (reset) begin
		uncached_wb_req_r <= 'd0;
	end else begin
		uncached_wb_req_r <=  (o_wb_uncached_req || uncached_wb_req_r) && !i_wb_uncached_ready;
	end
end