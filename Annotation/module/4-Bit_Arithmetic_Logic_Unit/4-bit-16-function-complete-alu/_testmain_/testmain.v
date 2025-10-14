`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:50:05 05/27/2019
// Design Name:   mainalu
// Module Name:   C:/Users/ahmer/Documents/ALU/testmain.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mainalu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmain;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [15:0] E;
	wire [3:0] andOut;
	wire [3:0] norOut;
	wire [3:0] nandOut;
	wire [3:0] orOut;
	wire [3:0] xorOut;
	wire [3:0] Abar;
	wire [3:0] Bbar;
	wire [3:0] adderOut;
	wire [3:0] Cout;

	// Instantiate the Unit Under Test (UUT)
	mainalu uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.a(a), 
		.b(b), 
		.E(E), 
		.andOut(andOut), 
		.norOut(norOut), 
		.nandOut(nandOut), 
		.orOut(orOut), 
		.xorOut(xorOut), 
		.Abar(Abar), 
		.Bbar(Bbar), 
		.adderOut(adderOut), 
		.Cout(Cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 1;
		C = 1;
		D = 1;
		
		a[0] = 1;
		a[1] = 0;
		a[2] = 1;
		a[3] = 0;
		
		b[0] = 1;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		
		
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

