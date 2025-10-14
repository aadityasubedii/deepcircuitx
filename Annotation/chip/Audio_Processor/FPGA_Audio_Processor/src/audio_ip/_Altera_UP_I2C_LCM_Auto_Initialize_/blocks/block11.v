always @(posedge clk)
begin
	if (reset == 1'b1)
		data_out <= 8'h00;
	else if (s_i2c_auto_init == AUTO_STATE_1_SEND_START_BIT)
		data_out <= {1'b0, rom_data[13: 8], 1'b0};
	else if (s_i2c_auto_init == AUTO_STATE_3_TRANSFER_BYTE_1)
		data_out <= rom_data[ 7: 0];
end