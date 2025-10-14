`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:36 03/18/2017 
// Design Name: 
// Module Name:    add_sub_4bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module add_sub_4bit(Sum, Cout, V, A, B, Operator);

	input [3:0] A, B;
	input Operator;
	output [3:0] Sum;
	output Cout, V;
	
	wire effective_B[3:0], carry_temp[2:0];
	
	assign effective_B[0] = B[0] ^ Operator;
	assign effective_B[1] = B[1] ^ Operator;
	assign effective_B[2] = B[2] ^ Operator;
	assign effective_B[3] = B[3] ^ Operator;

	full_adder fa1(Sum[0], carry_temp[0], A[0], effective_B[0], Operator);
	full_adder fa2(Sum[1], carry_temp[1], A[1], effective_B[1], carry_temp[0]);
	full_adder fa3(Sum[2], carry_temp[2], A[2], effective_B[2], carry_temp[1]);
	full_adder fa4(Sum[3], Cout, A[3], effective_B[3], carry_temp[2]);

	assign V = carry_temp[2] ^ Cout;

endmodule
