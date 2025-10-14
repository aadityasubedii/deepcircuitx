always @(posedge clk)
begin
	if (reset == 1'b1)
		i2c_scen <= 1'b1;
	else if (change_output_bit_en & (s_i2c_transceiver == I2C_STATE_2_START_BIT))
		i2c_scen <= 1'b0;
	else if (s_i2c_transceiver == I2C_STATE_5_STOP_BIT)
		i2c_scen <= 1'b1;
end