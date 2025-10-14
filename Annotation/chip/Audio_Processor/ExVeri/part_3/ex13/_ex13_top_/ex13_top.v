module ex13_top (CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	input CLOCK_50;
	output DAC_CS;
	output DAC_SDI;
	output DAC_LD;
	output DAC_SCK;
	output PWM_OUT;
	
	wire tick,load;
	wire [9:0] A;
	wire [9:0] D;
	
	
	clktick_16 TICK(CLOCK_50, tick);
	assign load = tick;
	
	reg reset_count;
	initial reset_count = 1'b0;
	counter_16 COUNT(CLOCK_50, load, reset_count, A);
	
	ROM rom(A, load, D);
	
	spi2dac SPI2DAC(CLOCK_50, D, load, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm PWM(CLOCK_50, D, load, PWM_OUT);
	
	always @ (posedge CLOCK_50)
	begin		
			if (reset_count == 16'd1023)
				reset_count <= 1'b1;
			else
				reset_count <= 1'b0;
	end
	
endmodule
	
	


