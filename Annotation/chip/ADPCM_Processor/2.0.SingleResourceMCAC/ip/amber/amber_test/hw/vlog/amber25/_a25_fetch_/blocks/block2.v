always @(posedge reset, posedge clk) begin
	if (reset) begin
		wb_req_r <= 'd0;
	end else begin
		wb_req_r <= o_wb_req && !i_wb_ready;
	end
end