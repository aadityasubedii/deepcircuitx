always @(posedge clk)
begin
	if (reset == 1'b1)
		data_size <= 3'h0;
	else if (s_i2c_auto_init == AUTO_STATE_1_SEND_START_BIT)
		data_size <= 3'h6;
	else if (s_i2c_auto_init == AUTO_STATE_3_TRANSFER_BYTE_1)
		data_size <= 3'h7;
end