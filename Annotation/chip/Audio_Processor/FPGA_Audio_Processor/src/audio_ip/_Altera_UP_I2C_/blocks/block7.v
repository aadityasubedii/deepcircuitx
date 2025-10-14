always @(posedge clk)
begin
	if (reset == 1'b1)
		data_from_i2c <= 8'h00;
	else if (start_and_stop_en & (s_i2c_transceiver == I2C_STATE_3_TRANSFER_BYTE))
		data_from_i2c <= {data_from_i2c[6:0], i2c_sdata};
end