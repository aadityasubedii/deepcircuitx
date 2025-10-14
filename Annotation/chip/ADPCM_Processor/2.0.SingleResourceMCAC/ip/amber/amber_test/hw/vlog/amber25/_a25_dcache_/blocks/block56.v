always @(posedge reset, posedge clk) begin
	if (reset) begin
		request_r 	<= 'd0;
	end else begin
		request_r <= (request_pulse || request_r) && o_stall;
	end
end