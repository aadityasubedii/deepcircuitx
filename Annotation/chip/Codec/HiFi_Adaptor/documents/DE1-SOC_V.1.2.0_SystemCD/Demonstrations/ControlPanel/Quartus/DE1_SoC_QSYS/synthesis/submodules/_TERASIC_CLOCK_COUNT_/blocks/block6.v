always @ (posedge s_clk_in or posedge s_reset_in)
begin
	if (s_reset_in)
		cnt_down <= 0;
	else if (s_write_in && s_address_in == `REG_START)
	begin
		cnt_down <= s_writedata_in;
		counting_now <= (s_writedata_in == 0)?1'b0:1'b1;
	end
	else if (cnt_down > 1)
		cnt_down <= cnt_down - 1;
	else
		counting_now <= 1'b0;
end