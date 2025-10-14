assign transfer_complete = 
		(s_i2c_transceiver == I2C_STATE_6_COMPLETE) ? 1'b1 : 1'b0;