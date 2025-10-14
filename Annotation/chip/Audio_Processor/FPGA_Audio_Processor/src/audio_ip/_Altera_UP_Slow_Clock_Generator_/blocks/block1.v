always @(posedge clk)
begin
	if (reset == 1'b1)
		middle_of_low_level <= 1'b0;
	else
		middle_of_low_level <= 
			~clk_counter[COUNTER_BITS] & 
			~clk_counter[(COUNTER_BITS - 1)] &
			(&(clk_counter[(COUNTER_BITS - 2):1]));
end