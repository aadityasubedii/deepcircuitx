`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:05:20 05/28/2019
// Design Name:   mainalu
// Module Name:   C:/Users/ahmer/Documents/ALU/maintest.v
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

module maintest;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg D;
	reg [3:0] a;
	reg [3:0] b;
	reg shiftCon;

	// Outputs
	wire [15:0] E;
	wire [3:0] andOut;
	wire [3:0] norOut;
	wire [3:0] nandOut;
	wire [3:0] orOut;
	wire [3:0] xorOut;
	wire [3:0] AbarOut;
	wire [3:0] BbarOut;
	wire [3:0] adderOut;
	wire Cout;
	wire Bout;
	wire [3:0] subtractOut;
	wire compGOut;
	wire compEOut;
	wire compLOut;
	wire [7:0] multiOut;
	wire evenAOut;
	wire evenBOut;
	wire oddAOut;
	wire oddBOut;
	wire [3:0] decremOut;
	wire [3:0] incremOut;
	wire [3:0] xnorOut;
	wire [3:0] shiftOut;

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
		.AbarOut(AbarOut), 
		.BbarOut(BbarOut), 
		.adderOut(adderOut), 
		.Cout(Cout), 
		.Bout(Bout), 
		.subtractOut(subtractOut), 
		.compGOut(compGOut), 
		.compEOut(compEOut), 
		.compLOut(compLOut), 
		.multiOut(multiOut), 
		.evenAOut(evenAOut), 
		.evenBOut(evenBOut), 
		.oddAOut(oddAOut), 
		.oddBOut(oddBOut), 
		.decremOut(decremOut), 
		.incremOut(incremOut), 
		.xnorOut(xnorOut), 
		.shiftOut(shiftOut), 
		.shiftCon(shiftCon)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		
		a[0] = 1;
		a[1] = 1;
		a[2] = 0;
		a[3] = 0;
		
		b[0] = 0;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		shiftCon = 0; // 0 for right shift

		// Wait 100 ns for global reset to finish
		#100;
		
		A = 0;
		B = 0;
		C = 0;
		D = 1;
		
		a[0] = 1;
		a[1] = 1;
		a[2] = 0;
		a[3] = 0;
		
		b[0] = 0;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		shiftCon = 0; // 0 for right shift
        #100;
		  
		A = 0;
		B = 0;
		C = 1;
		D = 0;
		
		a[0] = 1;
		a[1] = 1;
		a[2] = 0;
		a[3] = 0;
		
		b[0] = 0;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		shiftCon = 0; // 0 for right shift
		// Add stimulus here
		#100;
		A = 0;
		B = 0;
		C = 1;
		D = 1;
		
		a[0] = 1;
		a[1] = 1;
		a[2] = 0;
		a[3] = 0;
		
		b[0] = 0;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		shiftCon = 0; // 0 for right shift
		// Add stimulus here
		#100;

		A = 0;
		B = 1;
		C = 0;
		D = 0;
		
		a[0] = 1;
		a[1] = 1;
		a[2] = 0;
		a[3] = 0;
		
		b[0] = 0;
		b[1] = 1;
		b[2] = 0;
		b[3] = 0;
		shiftCon = 0; // 0 for right shift
		// Add stimulus here
		#100;



	end
      
endmodule

