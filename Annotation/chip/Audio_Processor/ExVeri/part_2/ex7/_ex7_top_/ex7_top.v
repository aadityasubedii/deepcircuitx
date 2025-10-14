module ex7_top(
	CLOCK_50,
	HEX0,		//Hex output on  segment display
	HEX1,
	KEY
);
	input CLOCK_50;
	input [3:3]KEY;
	output [6:0]HEX0;
	output [6:0]HEX1;
	
	wire [6:0] sreg_out;
	wire enable;
	
	assign enable = ~KEY[3]; //Key[3] is active low

	
	lfsr_7 shift(enable, CLOCK_50, sreg_out);

	hex_to_7seg		SEG0(HEX0,sreg_out[3:0]);
	hex_to_7seg		SEG1(HEX1,sreg_out[6:4]);
	
endmodule


