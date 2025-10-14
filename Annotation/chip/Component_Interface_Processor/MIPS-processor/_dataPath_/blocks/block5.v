module mux2_to_1_16bit (out, i0, i1, s0);
	
	
	output [15:0] out;
	input [15:0] i0, i1;
	input s0;

	reg [15:0] tempout;