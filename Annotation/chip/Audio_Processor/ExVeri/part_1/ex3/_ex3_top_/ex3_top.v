module ex3_top(
	SW,
	HEX0, HEX1, HEX2
);
	
	input [9:0] SW;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	
	hex_to_7seg	SEG0(HEX0,SW[3:0]);
	hex_to_7seg	SEG1(HEX1,SW[7:4]);
	hex_to_7seg	SEG2(HEX2,SW[9:8]);

endmodule