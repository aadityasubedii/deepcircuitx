always @(posedge clk)
begin
	if (reset == 1'b1) 
		transfer_data <= 1'b0;
	else if (transfer_complete == 1'b1)
		transfer_data <= 1'b0;
	else if (s_i2c_auto_init == AUTO_STATE_1_SEND_START_BIT)
		transfer_data <= 1'b1;
	else if (s_i2c_auto_init == AUTO_STATE_2_TRANSFER_BYTE_0)
		transfer_data <= 1'b1;
	else if (s_i2c_auto_init == AUTO_STATE_3_TRANSFER_BYTE_1)
		transfer_data <= 1'b1;
	else if (s_i2c_auto_init == AUTO_STATE_4_TRANSFER_BYTE_2)
		transfer_data <= 1'b1;
end