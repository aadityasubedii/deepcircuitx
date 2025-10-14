always @ (posedge CLK_2 or posedge trigger_send)
begin
	if (trigger_send)
	begin
		clk2_cnt <= 0;
	end
	else if (counting_now)
	begin
		clk2_cnt <= clk2_cnt + 1;
	end
end