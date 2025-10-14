always @(posedge clk)
begin
	if (reset == 1'b1)
		auto_init_error <= 1'b0;
	else if (clear_error == 1'b1)
		auto_init_error <= 1'b0;
	else if ((s_i2c_auto_init == AUTO_STATE_6_INCREASE_COUNTER) & ack)
		auto_init_error <= 1'b1;
end