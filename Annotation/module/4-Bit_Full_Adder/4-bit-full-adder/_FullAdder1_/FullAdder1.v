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
// CREATED		"Sun Nov 05 10:30:32 2023"

module FullAdder1(
	A,
	B,
	Ci,
	Co,
	S
);


input wire	A;
input wire	B;
input wire	Ci;
output wire	Co;
output wire	S;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	SYNTHESIZED_WIRE_3 = A & Ci;

assign	SYNTHESIZED_WIRE_1 = B & Ci;

assign	SYNTHESIZED_WIRE_2 = A & B;

assign	SYNTHESIZED_WIRE_0 = A ^ B;

assign	S = SYNTHESIZED_WIRE_0 ^ Ci;

assign	Co = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;


endmodule
