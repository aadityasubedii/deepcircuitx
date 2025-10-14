always @ (posedge s_clk_in or posedge s_reset_in)
begin
	if (s_reset_in)
		trigger_send <= 1'b0;
	else if (~pre_counting_now & counting_now)
		trigger_send <= 1'b1;
	else
		trigger_send <= 1'b0;
end