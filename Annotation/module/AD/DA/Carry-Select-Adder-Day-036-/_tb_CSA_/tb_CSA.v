`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2023 10:07:52 PM
// Design Name: 
// Module Name: tb_CSA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_CSA;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	carry_select_adder uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 8'b00000011;
		b = 8'b00000000;
		#10;
		
		a = 8'b00000000;
		b = 8'b00000001;
		#10;
		
		a = 8'b00000110;
		b = 8'b00000010;
		#10;
		
		a = 8'b00001000;
		b = 8'b00000011;
		#10;
		
		a = 8'b00001100;
		b = 8'b00000011;
		#10;
		
		a = 8'b00001000;
		b = 8'b00000100;
		#10;
        
	

	end
      
endmodule


