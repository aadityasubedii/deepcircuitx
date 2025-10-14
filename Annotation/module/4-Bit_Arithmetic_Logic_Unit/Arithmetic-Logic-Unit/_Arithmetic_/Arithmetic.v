`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:13 03/22/2017 
// Design Name: 
// Module Name:    Arithmetic 
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
module Arithmetic(arith_out, C, V, A, B, Opcode);

	input [3:0] A, B, Opcode;
	output [3:0] arith_out;
	output C, V;
	wire [3:0] sum1, sum2, sum3, sum4, temp_C, temp_V;
	
	add_sub_4bit a1(sum1, temp_C[0], temp_V[0], A, B, 1'b0);
	add_sub_4bit a2(sum2, temp_C[1], temp_V[1], A, 4'b0001, 1'b0);
	add_sub_4bit a3(sum3, temp_C[2], temp_V[2], A, B, 1'b1);
	add_sub_4bit a4(sum4, temp_C[3], temp_V[3], A, 4'b0001, 1'b1);

	assign arith_out = (Opcode == 4'b0100) ? sum1
						  : (Opcode == 4'b0101) ? sum2
						  : (Opcode == 4'b0110) ? sum3
						  : (Opcode == 4'b0111) ? sum4
						  : 4'b0000;
						  
	assign C = (Opcode == 4'b0100) ? temp_C[0]
						  : (Opcode == 4'b0101) ? temp_C[1]
						  : (Opcode == 4'b0110) ? temp_C[2]
						  : (Opcode == 4'b0111) ? temp_C[3]
						  : 1'b0;
						  
	assign V = (Opcode == 4'b0100) ? temp_V[0]
						  : (Opcode == 4'b0101) ? temp_V[1]
						  : (Opcode == 4'b0110) ? temp_V[2]
						  : (Opcode == 4'b0111) ? temp_V[3]
						  : 1'b0;

endmodule
