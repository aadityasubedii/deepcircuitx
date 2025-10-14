`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:41 05/28/2019
// Design Name:   evenparity
// Module Name:   C:/Users/ahmer/Documents/ALU/EVEN.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: evenparity
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EVEN;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg E;

	// Outputs
	wire ansA;
	wire ansB;

	// Instantiate the Unit Under Test (UUT)
	evenparity uut (
		.a(a), 
		.b(b), 
		.E(E), 
		.ansA(ansA), 
		.ansB(ansB)
	);

	initial begin
		// Initialize Inputs
		a = 12;
		b = 13;
		E = 00;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

