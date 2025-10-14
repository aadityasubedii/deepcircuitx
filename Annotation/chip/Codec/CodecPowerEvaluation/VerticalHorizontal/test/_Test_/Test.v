`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Test;

	// Inputs
	reg [15:0] data_in;
	reg [23:0] bit_flip;
	reg clk;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Codec uut (
		.data_in(data_in), 
		.bit_flip(bit_flip), 
		.clk(clk), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		bit_flip = 0;
		clk = 0;
	end
	
	always
	begin
		#5 data_in = {$random}%65535;
		#5;
		#5 bit_flip = 1 << ({$random}%24);
		#5;
	end
	
	always
	begin
		#10 clk = ~clk;
	end
      
endmodule

