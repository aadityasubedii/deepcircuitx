assign i2c_sclk		= (I2C_BUS_MODE == 1'b0) ? 
						clk_400KHz :
						((s_i2c_transceiver == I2C_STATE_3_TRANSFER_BYTE) |
						(s_i2c_transceiver == I2C_STATE_4_TRANSFER_ACK)) ?
							clk_400KHz :
							1'b0;