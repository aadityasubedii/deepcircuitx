`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:59 03/22/2017
// Design Name:   ALU_4bit
// Module Name:   D:/AssignmentsDone/ALU/ALU_4bit_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_4bit_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [3:0] Opcode;
	integer i;

	// Outputs
	wire [3:0] Out;
	wire Z;
	wire C;
	wire V;
	wire P;

	// Instantiate the Unit Under Test (UUT)
	ALU_4bit uut (
		.Out(Out), 
		.Z(Z), 
		.C(C), 
		.V(V), 
		.P(P), 
		.A(A), 
		.B(B), 
		.Opcode(Opcode)
	);

	initial begin
		A = 4'b0101;
		B = 4'b1100;
		Opcode = 0;

		for (i = 0; i < 16; i = i + 1)
		begin
			#10
			Opcode = i;
		end
	end
      
endmodule

