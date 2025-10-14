`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:09 03/18/2017 
// Design Name: 
// Module Name:    Shifter 
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
module Shifter(shift_out, A, B, Opcode);

	output [3:0] shift_out;
	input [3:0] A, B, Opcode;
	wire [3:0] left_shift, right_shift;
	
	assign left_shift = B << A[1:0];
	assign right_shift = B >> A[1:0];
	
	assign shift_out = (Opcode == 4'b0000) ? left_shift 
							:(Opcode == 4'b0001) ? left_shift
							:(Opcode == 4'b0010) ? right_shift
							:(Opcode == 4'b0011) ? ({B[3], right_shift[2:0]})
							: 4'b0000;

endmodule
