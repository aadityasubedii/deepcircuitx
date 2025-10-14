`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Coder(
	input wire [15:0] data_in,
	input wire clk,
	output reg [20:0] data_out
	);
	
	reg [15:0] data_in_reg;
	
	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	
	// Combinational Logic
	always @(*)
	begin
	
		// Parity bits: ////////////////////////////////////////////////////////////////////////////////
		data_out[0] = data_in_reg[0] ^ 
								data_in_reg[1] ^ data_in_reg[3] ^ 
								data_in_reg[4] ^ data_in_reg[6] ^ data_in_reg[8] ^ data_in_reg[10] ^
								data_in_reg[11] ^ data_in_reg[13] ^ data_in_reg[15];
								
		data_out[1] = data_in_reg[0] ^ 
								data_in_reg[2] ^ data_in_reg[3] ^ 
								data_in_reg[5] ^ data_in_reg[6] ^ data_in_reg[9] ^ data_in_reg[10] ^
								data_in_reg[12] ^ data_in_reg[13];
								
		data_out[3] = data_in_reg[1] ^ data_in_reg[2] ^ data_in_reg[3] ^
								data_in_reg[7] ^ data_in_reg[8] ^ data_in_reg[9] ^ data_in_reg[10] ^
								data_in_reg[14] ^ data_in_reg[15];
								
		data_out[7] = data_in_reg[4] ^ data_in_reg[5] ^ data_in_reg[6] ^ data_in_reg[7] ^ 
								data_in_reg[8] ^ data_in_reg[9] ^ data_in_reg[10];
		
		data_out[15] = data_in_reg[11] ^ data_in_reg[12] ^ data_in_reg[13] ^ data_in_reg[14] ^ data_in_reg[15];
		////////////////////////////////////////////////////////////////////////////////////////////////


		// Data bits: //////////////////////////////////////////////////////////////////////////////////
		data_out[2] = data_in_reg[0];

		data_out[4] = data_in_reg[1];
		data_out[5] = data_in_reg[2];
		data_out[6] = data_in_reg[3];

		data_out[8] = data_in_reg[4];
		data_out[9] = data_in_reg[5];
		data_out[10] = data_in_reg[6];
		data_out[11] = data_in_reg[7];
		data_out[12] = data_in_reg[8];
		data_out[13] = data_in_reg[9];
		data_out[14] = data_in_reg[10];

		data_out[16] = data_in_reg[11];
		data_out[17] = data_in_reg[12];
		data_out[18] = data_in_reg[13];
		data_out[19] = data_in_reg[14];
		data_out[20] = data_in_reg[15];
		////////////////////////////////////////////////////////////////////////////////////////////////

	end


endmodule
