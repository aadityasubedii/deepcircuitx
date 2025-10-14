module ex2_top(
	SW,		//Input switches
	HEX0		//Hex output on  segment display
);
	input	[3:0]SW;	//declare input/output ports
	output [6:0]HEX0;
	
	hex_to_7seg		SEG0(HEX0,SW);
endmodule