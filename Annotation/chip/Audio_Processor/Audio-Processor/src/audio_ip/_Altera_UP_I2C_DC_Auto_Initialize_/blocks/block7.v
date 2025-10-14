always @(posedge clk)
begin
	if (reset == 1'b1)
		send_stop_bit <= 1'b0;
	else if (transfer_complete == 1'b1)
		send_stop_bit <= 1'b0;
	else if (s_i2c_auto_init == AUTO_STATE_6_SEND_STOP_BIT)
		send_stop_bit <= 1'b1;
end