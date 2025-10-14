`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:33 03/22/2017 
// Design Name: 
// Module Name:    MUX 
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
module MUX(Out, shift_out, arith_out, logical_out, compare_out, Opcode);

	output [3:0] Out;
	input [3:0] shift_out, arith_out, logical_out, compare_out, Opcode;
	
	assign Out = (Opcode == 4'b0000 || Opcode == 4'b0001 || Opcode == 4'b0010 || Opcode == 4'b0011) ? shift_out
				  : (Opcode == 4'b0100 || Opcode == 4'b0101 || Opcode == 4'b0110 || Opcode == 4'b0111) ? arith_out
				  : (Opcode == 4'b1000 || Opcode == 4'b1001 || Opcode == 4'b1010 || Opcode == 4'b1011) ? logical_out
				  : (Opcode == 4'b1100 || Opcode == 4'b1101 || Opcode == 4'b1110 || Opcode == 4'b1111) ? compare_out
				  : 4'b0000;

endmodule
