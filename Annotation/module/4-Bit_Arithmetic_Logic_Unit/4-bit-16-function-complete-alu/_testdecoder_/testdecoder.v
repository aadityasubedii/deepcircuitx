`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:57 05/27/2019
// Design Name:   decoder
// Module Name:   E:/Education/Computer Engineering/Semester 2/ALU/testdecoder.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testdecoder;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;

	// Outputs
	wire [15:0] E;

	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.E(E)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A = 1;
		B = 0;
		C = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

