`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Codec(
	input wire [15:0] data_in,
	input wire [20:0] bit_flip,
	input wire clk,
	output wire [15:0] data_out
   );

	wire [20:0] data_coded;
	wire [20:0] data_augmented;
	
	Coder coder (
		.data_in(data_in), 
		.clk(clk), 
		.data_out(data_coded)
	);
	
	assign data_augmented = data_coded ^ bit_flip;
	
	Decoder decoder (
		.data_in(data_augmented), 
		.clk(clk), 
		.data_out(data_out)
	);

endmodule
