`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:54 06/01/2019
// Design Name:   nandgatemod
// Module Name:   C:/Users/dell/Desktop/ALU/abc.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nandgatemod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module abc;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg E;

	// Outputs
	wire [3:0] iab;

	// Instantiate the Unit Under Test (UUT)
	nandgatemod uut (
		.a(a), 
		.b(b), 
		.E(E), 
		.iab(iab)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		E = 0;

		// Wait 100 ns for global reset to finish
		#100;
		a = 0;
		b = 1;
		E = 1;
		#100;
		a = 1;
		b = 1;
		E = 1;
		#100;
		a = 1;
		b = 0;
		E = 1;
		#100;
		// Add stimulus here

	end
      
endmodule

