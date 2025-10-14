`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:32 03/18/2017 
// Design Name: 
// Module Name:    logical 
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
module Logical(logical_out, A, B, Opcode);

	output [3:0] logical_out;
	input [3:0] A, B, Opcode;

	assign logical_out = (Opcode == 4'b1000) ? (A & B)
							 : (Opcode == 4'b1001) ? (A | B)
							 : (Opcode == 4'b1010) ? (A ^ B)
							 : (Opcode == 4'b1011) ? ~(A | B)
							 : 4'b0000;

endmodule
