always @ (posedge s_clk_in or posedge s_reset_in)
begin
	if (s_reset_in)
		pre_counting_now <= 1'b0;
	else
		pre_counting_now <= counting_now;
		
end