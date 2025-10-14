module mux2_to_1_4bit (out, i0, i1, s0);
	
	
	output [3:0] out;
	input [3:0] i0, i1;
	input s0;

	reg [3:0] tempout;