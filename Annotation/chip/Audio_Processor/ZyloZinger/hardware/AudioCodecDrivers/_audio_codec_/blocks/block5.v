Altera_UP_Clock_Edge Bit_Clock_Edges (
	
	.clk			(clk),
	.reset		(reset),
	
	.test_clk		(AUD_BCLK),
	
	

	
	.rising_edge	(bclk_rising_edge),
	.falling_edge	(bclk_falling_edge)
);