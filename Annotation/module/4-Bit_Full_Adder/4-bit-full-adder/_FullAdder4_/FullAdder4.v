// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Sun Nov 05 10:30:03 2023"

module FullAdder4(
	Ci,
	A,
	B,
	Co,
	S
);


input wire	Ci;
input wire	[3:0] A;
input wire	[3:0] B;
output wire	Co;
output wire	[3:0] S;

wire	[3:0] S_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





FullAdder1	b2v_inst(
	.Ci(SYNTHESIZED_WIRE_0),
	.B(B[3]),
	.A(A[3]),
	.S(S_ALTERA_SYNTHESIZED[3]),
	.Co(Co));


FullAdder1	b2v_inst1(
	.Ci(SYNTHESIZED_WIRE_1),
	.B(B[2]),
	.A(A[2]),
	.S(S_ALTERA_SYNTHESIZED[2]),
	.Co(SYNTHESIZED_WIRE_0));


FullAdder1	b2v_inst2(
	.Ci(SYNTHESIZED_WIRE_2),
	.B(B[1]),
	.A(A[1]),
	.S(S_ALTERA_SYNTHESIZED[1]),
	.Co(SYNTHESIZED_WIRE_1));


FullAdder1	b2v_inst3(
	.Ci(Ci),
	.B(B[0]),
	.A(A[0]),
	.S(S_ALTERA_SYNTHESIZED[0]),
	.Co(SYNTHESIZED_WIRE_2));

assign	S = S_ALTERA_SYNTHESIZED;

endmodule
