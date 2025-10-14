always @(posedge clk)
begin
	if (reset == 1'b1)
		clk_counter	<= {COUNTER_BITS{1'b0}};
	else if (enable_clk == 1'b1)
		clk_counter	<= clk_counter + COUNTER_INC;
end