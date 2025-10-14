always @ (posedge CLK_1 or posedge trigger_send)
begin
	if (trigger_send)
		clk1_cnt <= 0;
	else if (counting_now)
	begin
		clk1_cnt <= clk1_cnt + 1;
	end
end