always @(posedge clk)
begin
	if (reset == 1'b1)
		new_clk	<= 1'b0;
	else
		new_clk	<= clk_counter[COUNTER_BITS];
end