always @(posedge clk)
begin
	if (reset == 1'b1)
		ack <= 1'b0;
	else if (clear_ack == 1'b1)
		ack <= 1'b0;
	else if (start_and_stop_en & (s_i2c_transceiver == I2C_STATE_4_TRANSFER_ACK))
		ack <= i2c_sdata ^ I2C_BUS_MODE;
end