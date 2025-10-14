always @ (posedge s_clk_in or posedge s_reset_in)
begin
	if (s_reset_in)
		s_readdata_out <= 0;
	else if (s_read_in && s_address_in == `REG_START)
		s_readdata_out <= {31'h0, counting_now};
	else if (s_read_in && s_address_in == `REG_READ_CLK1)
		s_readdata_out <= clk1_cnt;
	else if (s_read_in && s_address_in == `REG_READ_CLK2)
		s_readdata_out <= clk2_cnt;
end