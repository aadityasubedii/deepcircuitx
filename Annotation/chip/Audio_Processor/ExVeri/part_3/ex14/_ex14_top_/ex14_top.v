module ex14_top(
CLOCK_50,
SW, 
HEX0, HEX1, HEX2, HEX3, HEX4,
DAC_SDI, DAC_CS, DAC_SCK, DAC_LD,
PWM_OUT);

	input CLOCK_50;
	input [9:0] SW;
	
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
	output DAC_SDI, DAC_CS, DAC_SCK, DAC_LD, PWM_OUT;
	
	wire TICK_10KHz;
	wire [9:0] DATA;
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	wire [23:0] MULT_RES;
	
	reg [9:0] COUNT;
	
	initial COUNT = 10'b0;
	
	clktick_16 div_5k(CLOCK_50, TICK_10KHz, 16'd5000, 1'b1);
	
	ROM rom_data(COUNT, TICK_10KHz, DATA);
	
	spi2dac analogue_out0(CLOCK_50, DATA, TICK_10KHz, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm analogue_out1(CLOCK_50, DATA, TICK_10KHz, PWM_OUT);
	
	MULT times_10k(SW,MULT_RES);
	
	bin2bcd_16 top14_to_bcd({2'b0, MULT_RES[23:10]}, BCD0, BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg SEG0(HEX0, BCD0);
	hex_to_7seg SEG1(HEX1, BCD1);
	hex_to_7seg SEG2(HEX2, BCD2);
	hex_to_7seg SEG3(HEX3, BCD3);
	hex_to_7seg SEG4(HEX4, BCD4);
	
	always @ (posedge TICK_10KHz)
		COUNT <= COUNT + SW;

	endmodule
	
	