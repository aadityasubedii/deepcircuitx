always @(posedge clk)
begin
	if (reset == 1'b1)
		current_byte <= 8'h00;
	else if ((s_i2c_transceiver == I2C_STATE_0_IDLE) || 
			 (s_i2c_transceiver == I2C_STATE_2_START_BIT))
		current_byte <= data_in;
end