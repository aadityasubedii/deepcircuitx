`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:51:42 11/19/2019
// Design Name:   encoder42
// Module Name:   F:/college/year 2/sem 3/digital hardware/verilog/encoder/encoder42_tb.v
// Project Name:  encoder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder42
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder42_tb;

	// Inputs
	reg D0;
	reg D1;
	reg D2;
	reg D3;

	// Outputs
	wire Q0;
	wire Q1;
	wire V;

	// Instantiate the Unit Under Test (UUT)
	encoder42 uut (
		.D0(D0), 
		.D1(D1), 
		.D2(D2), 
		.D3(D3), 
		.Q0(Q0), 
		.Q1(Q1), 
		.V(V)
	);

	initial begin
		// Initialize Inputs
		D0 = 1;
		D1 = 0;
		D2 = 0;
		D3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		D0 = 0;
		D1 = 1;
		D2 = 0;
		D3 = 0;
		
		#100;
		D0 = 0;
		D1 = 0;
		D2 = 1;
		D3 = 0;
		
		#100;
		D0 = 0;
		D1 = 0;
		D2 = 0;
		D3 = 1;
        
		// Add stimulus here

	end
      
endmodule

