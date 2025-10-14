always @(posedge clk)
begin
	if (reset == 1'b1)
		s_i2c_auto_init <= AUTO_STATE_0_CHECK_STATUS;
	else
		s_i2c_auto_init <= ns_i2c_auto_init;
end