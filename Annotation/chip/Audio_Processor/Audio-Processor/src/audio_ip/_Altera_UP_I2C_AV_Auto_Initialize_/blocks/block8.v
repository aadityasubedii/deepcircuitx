always @(posedge clk)
begin
	if (reset == 1'b1)
		send_start_bit <= 1'b0;
	else if (transfer_complete == 1'b1)
		send_start_bit <= 1'b0;
	else if (s_i2c_auto_init == AUTO_STATE_1_SEND_START_BIT)
		send_start_bit <= 1'b1;
end