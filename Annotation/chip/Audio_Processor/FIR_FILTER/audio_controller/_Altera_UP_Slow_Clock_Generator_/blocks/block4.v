always @(posedge clk)
begin
	if (reset == 1'b1)
		rising_edge	<= 1'b0;
	else
		rising_edge	<= (clk_counter[COUNTER_BITS] ^ new_clk) & ~new_clk;
end