always @(posedge clk)
begin
	if (reset == 1'b1)
		rom_address_counter <= MIN_ROM_ADDRESS;
	else if (s_i2c_auto_init == AUTO_STATE_7_INCREASE_COUNTER)
		rom_address_counter <= rom_address_counter + 5'h01;
end