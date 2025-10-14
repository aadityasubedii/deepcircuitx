Altera_UP_Slow_Clock_Generator Clock_Generator_400KHz (
	
	.clk					(clk),
	.reset					(internal_reset),

	.enable_clk				(enable_clk),
	
	

	
	.new_clk				(clk_400KHz),

	.rising_edge			(),
	.falling_edge			(),

	.middle_of_high_level	(start_and_stop_en),
	.middle_of_low_level	(change_output_bit_en)
);