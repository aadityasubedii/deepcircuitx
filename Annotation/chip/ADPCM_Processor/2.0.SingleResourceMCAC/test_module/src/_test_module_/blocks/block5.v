always @( posedge reset, posedge clk ) begin
	if (reset) begin
		cycles_reg <= 'd0;
	end else begin
		cycles_reg <= cycles_reg + 1'd1;
	end
end