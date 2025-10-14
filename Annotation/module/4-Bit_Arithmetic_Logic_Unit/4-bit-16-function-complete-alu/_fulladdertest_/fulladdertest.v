`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:32:38 05/26/2019
// Design Name:   fulladder
// Module Name:   E:/Education/Computer Engineering/Semester 2/ALU/fulladdertest.v
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

module fulladdertest;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire cout;
	wire s;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
		#10;

		a = 1;
		b = 0;
		cin = 0;
		#10;
		
		a = 0;
		b = 1;
		cin = 0;
		#10;	
		
		a = 1;
		b = 1;
		cin = 0;
		#10;
		
		a = 0;
		b = 0;
		cin = 1;
		#10;	
		
		a = 1;
		b = 0;
		cin = 1;
		#10;
		
		a = 0;
		b = 1;
		cin = 1;
		#10;	
		
		a = 1;
		b = 1;
		cin = 1;
		#10;			
        
		// Add stimulus here

	end
      
endmodule

