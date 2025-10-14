module ex11_top(SW, CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

// io
	input [9:0] SW;
	input CLOCK_50;
	
	output DAC_CS;		
	output DAC_SDI;			
	output DAC_LD;		
	output DAC_SCK;
	output PWM_OUT;
	
	wire load, tick;
	//wire data_in;
	//assign data_in = SW;
	
	clktick_16 TICK(CLOCK_50, tick);
	
	assign load = tick;
	
	
	pwm PWM(CLOCK_50, SW, load, PWM_OUT);

	spi2dac SD(CLOCK_50, SW, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
endmodule
