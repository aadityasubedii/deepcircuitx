always @(posedge clk)
begin
	if (internal_reset == 1'b1)
	begin
		s_alavon_slave <= I2C_STATE_0_IDLE;
	end
	else
	begin
		s_alavon_slave <= ns_alavon_slave;
	end
end