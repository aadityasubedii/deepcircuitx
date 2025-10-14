assign enable_clk	= ~(s_i2c_transceiver == I2C_STATE_0_IDLE) &&
			~(s_i2c_transceiver == I2C_STATE_6_COMPLETE);