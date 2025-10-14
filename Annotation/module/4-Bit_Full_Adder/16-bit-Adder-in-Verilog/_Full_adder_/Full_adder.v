module Fulladder (in1, in2, carry_in, carry_out, sum);
	input in1, in2, carry_in;
	output carry_out, sum;
	wire [2:0] wires;
	
	xor G1(wires[0], in1, in2);
	xor G2(sum, carry_in, wires[0]);
	and G3(wires[1], wires[0], carry_in);
	and G4(wires[2], in1, in2);
	xor G5(carry_out, wires[1], wires[2]);
endmodule