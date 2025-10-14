always @(posedge clk)
	if (reset == 1'b1)
		transfer_is_read <= 1'b0;
	else if ((s_alavon_slave == I2C_STATE_1_START) && (address == 2'h0))
		transfer_is_read <= writedata[3];
