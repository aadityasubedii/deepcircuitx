always @( posedge reset, posedge clk ) begin
	if (reset) begin
		fetch_only_stall_r <= 'd0;
	end else begin
		fetch_only_stall_r <= fetch_only_stall;
	end
end