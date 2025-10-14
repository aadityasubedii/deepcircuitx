`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Decoder(
	input wire [23:0] data_in,
	input wire clk,
	output reg [15:0] data_out
	);

	reg [23:0] data_in_reg;
	
	reg [3:0] horizontal, horizontal_missmatch;
	reg [3:0] vertical, vertical_missmatch;

	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	integer i, j;
	// Combinational Logic
	always @(*)
	begin
		for(i = 0; i < 4; i = i + 1)
		begin
			horizontal[i] = data_in_reg[i*4] ^ data_in_reg[i*4 + 1] ^ 
								data_in_reg[i*4 + 2] ^ data_in_reg[i*4 + 3];
			
			vertical[i] = data_in_reg[i] ^ data_in_reg[i + 4] ^ 
								data_in_reg[i + 8] ^ data_in_reg[i + 12];
		end
		
		horizontal_missmatch = horizontal ^ data_in_reg[19:16];
		vertical_missmatch = vertical ^ data_in_reg[23:20];
		
		for(i = 0; i < 4; i = i + 1)
		begin
			for(j = 0; j < 4; j = j + 1)
			begin
				data_out[4 * i + j] = data_in_reg[4 * i + j] ^ 
											(horizontal_missmatch[i] & vertical_missmatch[j]);
			end
		end
		
	end

endmodule
