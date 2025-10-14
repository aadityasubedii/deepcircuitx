module ALU4bit (A,B,Result,Cin,Cout);
	input [3:0] A,B;
	output [3:0] Result;
	wire [3:1] carry_wires;
	input Cin;
	output Cout;
	
	Fulladder FA1(.in1(A[0]), .in2(B[0]), .carry_in(Cin), .carry_out(carry_wires[1]), .sum(Result[0]));
	Fulladder FA2(.in1(A[1]), .in2(B[1]), .carry_in(carry_wires[1]), .carry_out(carry_wires[2]), .sum(Result[1]));
	Fulladder FA3(.in1(A[2]), .in2(B[2]), .carry_in(carry_wires[2]), .carry_out(carry_wires[3]), .sum(Result[2]));
	Fulladder FA4(.in1(A[3]), .in2(B[3]), .carry_in(carry_wires[3]), .carry_out(Cout), .sum(Result[3]));
endmodule