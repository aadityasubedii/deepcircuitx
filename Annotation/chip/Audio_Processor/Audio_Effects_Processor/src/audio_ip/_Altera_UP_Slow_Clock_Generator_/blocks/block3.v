always @(posedge clk)
begin
	if (reset == 1'b1)
		falling_edge <= 1'b0;
	else
		falling_edge <= (clk_counter[COUNTER_BITS] ^ new_clk) & new_clk;
end