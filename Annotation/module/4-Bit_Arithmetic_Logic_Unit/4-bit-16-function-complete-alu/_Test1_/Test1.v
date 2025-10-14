`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:20 05/26/2019
// Design Name:   fulladder
// Module Name:   E:/Education/Computer Engineering/Semester 2/ALU/Test1.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fulladder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test1;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg [3:0] c;

	// Outputs
	wire cout;
	wire [3:0] s;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.cout(cout), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
      
endmodule

