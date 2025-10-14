Altera_UP_Clock_Edge DAC_Left_Right_Clock_Edges (
	
	.clk			(CLOCK_50),
	.reset		(reset),
	
	.test_clk		(AUD_DACLRCK),
	
	

	
	.rising_edge	(dac_lrclk_rising_edge),
	.falling_edge	(dac_lrclk_falling_edge)
);