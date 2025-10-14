
module ex10_top (SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK);

	input	[9:0] SW;
	input CLOCK_50;

	output DAC_CS;		
	output DAC_SDI;			
	output DAC_LD;		
	output DAC_SCK;

	wire load, tick;				// Pulse to load data to dacl
	
	clktick_16 TICK(CLOCK_50, tick);
	
	assign load = tick;
	
	spi2dac SD(CLOCK_50, SW, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
endmodule
