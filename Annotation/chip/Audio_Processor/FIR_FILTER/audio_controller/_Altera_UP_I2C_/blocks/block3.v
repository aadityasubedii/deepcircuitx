assign i2c_sdata	= 
	(s_i2c_transceiver == I2C_STATE_2_START_BIT) ? 1'b0 :
	(s_i2c_transceiver == I2C_STATE_5_STOP_BIT) ? 1'b0 :
	((s_i2c_transceiver == I2C_STATE_4_TRANSFER_ACK) & read_byte) ? 1'b0 :
	((s_i2c_transceiver == I2C_STATE_3_TRANSFER_BYTE) & ~read_byte) ? 
		current_byte[current_bit]
		: 1'bz;