module ex12_top(
CLOCK_50,
SW, HEX0, HEX1, HEX2, HEX3, HEX4
);
	input CLOCK_50;
	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;
	
	wire [9:0] ROM_OUT;
	wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;
	
	ROM rom1(SW, CLOCK_50, ROM_OUT);
	
	bin2bcd_16 display({6'b0,ROM_OUT},BCD0,BCD1, BCD2, BCD3, BCD4);
	
	hex_to_7seg seg0(HEX0, BCD0);
	hex_to_7seg seg1(HEX1,BCD1);
	hex_to_7seg seg2(HEX2, BCD2);
	hex_to_7seg seg3(HEX3, BCD3);
	hex_to_7seg seg4(HEX4, BCD4);
	
endmodule