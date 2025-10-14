always @ (posedge clk)
begin
	if (s_cs & s_write)
		test_reset_n <= s_writedata[0];
	else if (s_cs & s_read)
		s_readdata <= lb_error;
end