always @(posedge clk)
	if (reset == 1'b1)
		read_byte <= 1'b0;
	else if (s_alavon_slave == I2C_STATE_1_START)
		read_byte <= read;
