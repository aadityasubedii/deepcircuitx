always @ (clk)
begin
	if (~reset_n)
		fifo_clear <= 1'b0;
	else if (s_write && (s_address == `IR_RX_CS_REG))
		fifo_clear <= s_writedata[0];
	else if (fifo_clear)
		fifo_clear <= 1'b0;
end