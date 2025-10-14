always @(posedge clk)
begin
	if (reset == 1'b1)
		s_i2c_transceiver <= I2C_STATE_0_IDLE;
	else
		s_i2c_transceiver <= ns_i2c_transceiver;
end