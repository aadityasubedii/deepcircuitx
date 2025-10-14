`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Coder(
	input wire [15:0] data_in,
	input wire clk,
	output reg [23:0] data_out
	);

	reg [15:0] data_in_reg;
	
	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	
	integer i;
	// Combinational Logic
	always @(*)
	begin
		data_out[15:0] = data_in_reg;
		
		for(i = 0; i < 4; i = i + 1)
		begin
			data_out[16 + i] = data_in_reg[i*4] ^ data_in_reg[i*4 + 1] ^ 
									data_in_reg[i*4 + 2] ^ data_in_reg[i*4 + 3];
			
			data_out[20 + i] = data_in_reg[i] ^ data_in_reg[i + 4] ^ 
									data_in_reg[i + 8] ^ data_in_reg[i + 12];
		end
	end

endmodule
