`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Decoder(
	input wire [47:0] data_in,
	input wire clk,
	output wire [15:0] data_out
	);

	reg [47:0] data_in_reg;
	
	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	Voter #(.data_len(16)) voter(
		.a(data_in_reg[15:0]),
		.b(data_in_reg[31:16]),
		.c(data_in_reg[47:32]),
		.out(data_out)
	);

endmodule
