Altera_UP_Clock_Edge ADC_Left_Right_Clock_Edges (
	
	.clk			(CLOCK_50),
	.reset		(reset),
	
	.test_clk		(AUD_ADCLRCK),
	
	

	
	.rising_edge	(adc_lrclk_rising_edge),
	.falling_edge	(adc_lrclk_falling_edge)
);