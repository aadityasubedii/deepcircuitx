always @(posedge clk)
begin
	if (reset == 1'b1)
		data_out <= 8'h00;
	else if (s_i2c_auto_init == AUTO_STATE_1_SEND_START_BIT)
		data_out <= rom_data[23:16];
	else if (s_i2c_auto_init == AUTO_STATE_0_CHECK_STATUS)
		data_out <= rom_data[15: 8];
	else if (s_i2c_auto_init == AUTO_STATE_2_TRANSFER_BYTE_1)
		data_out <= rom_data[15: 8];
	else if (s_i2c_auto_init == AUTO_STATE_3_TRANSFER_BYTE_2)
		data_out <= rom_data[ 7: 0];
end