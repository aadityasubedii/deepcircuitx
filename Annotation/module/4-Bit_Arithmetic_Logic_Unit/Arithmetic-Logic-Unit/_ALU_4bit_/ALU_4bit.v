`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:24 03/18/2017 
// Design Name: 
// Module Name:    ALU 
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
module ALU_4bit(Out, Z, C, V, P, A, B, Opcode);

	input [3:0] A, B, Opcode;
	output Z, C, V, P;
	output [3:0] Out;
	wire temp_C, temp_V;
	wire [3:0] shift_out, arith_out, comp_out, logical_out;

	Shifter s(shift_out, A, B, Opcode);
	Arithmetic a(arith_out, temp_C, temp_V, A, B, Opcode);
	Comparator c(comp_out, A, B, Opcode);
	Logical l(logical_out, A, B, Opcode);
	
	MUX m(Out, shift_out, arith_out, logical_out, comp_out, Opcode);
	
	assign C = (Opcode > 3 && Opcode < 8) ? temp_C
				: 1'b0;

	assign V = (Opcode > 3 && Opcode < 8) ? temp_V
				: 1'b0;
				
	assign P = Out[3] ^ Out[2] ^ Out[1] ^ Out[0];
	
	assign Z = (Out[3] == 0) & (Out[2] == 0) & (Out[1] == 0) & (Out[0] == 0);
	
endmodule
