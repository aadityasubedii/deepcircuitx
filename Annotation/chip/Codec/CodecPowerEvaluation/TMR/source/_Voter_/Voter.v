`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Voter
#(parameter data_len = 16)(
	input wire [data_len-1:0] a,
	input wire [data_len-1:0] b,
	input wire [data_len-1:0] c,
	output wire [data_len-1:0] out
   );

	assign out = (a&b) | (b&c) | (a&c);

endmodule
