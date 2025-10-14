`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Decoder(
	input wire [20:0] data_in,
	input wire clk,
	output reg [15:0] data_out
	);

	reg [20:0] data_in_reg;
	reg [20:0] tmp;
	reg [4:0] parity;
	reg [21:0] mask;
	
	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	
	// Combinational Logic
	always @(*)
	begin
	
		// Parity bits: ////////////////////////////////////////////////////////////////////////////////
		parity[0] = data_in_reg[0] ^ data_in_reg[2] ^ data_in_reg[4] ^ data_in_reg[6] ^ 
						data_in_reg[8] ^ data_in_reg[10] ^ data_in_reg[12] ^ data_in_reg[14] ^ 
						data_in_reg[16] ^ data_in_reg[18] ^ data_in_reg[20];
								
		parity[1] = data_in_reg[1] ^ data_in_reg[2] ^ data_in_reg[5] ^ data_in_reg[6] ^ 
						data_in_reg[9] ^ data_in_reg[10] ^ data_in_reg[13] ^ data_in_reg[14] ^ 
						data_in_reg[17] ^ data_in_reg[18];
								
		parity[2] = data_in_reg[3] ^ data_in_reg[4] ^ data_in_reg[5] ^	data_in_reg[6] ^ 
						data_in_reg[11] ^ data_in_reg[12] ^ data_in_reg[13] ^ data_in_reg[14] ^ 
						data_in_reg[19] ^ data_in_reg[20];
								
		parity[3] = data_in_reg[7] ^ data_in_reg[8] ^ data_in_reg[9] ^ data_in_reg[10] ^ 
						data_in_reg[11] ^ data_in_reg[12] ^ data_in_reg[13] ^ data_in_reg[14];
		
		parity[4] = data_in_reg[15] ^ data_in_reg[16] ^ data_in_reg[17] ^ data_in_reg[18] ^ 
						data_in_reg[19] ^ data_in_reg[20];
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		mask = 22'b1 << parity;
	
		tmp = data_in_reg;
		tmp = tmp ^ mask[21:1];
		
		data_out[0] = tmp[2];

		data_out[1] = tmp[4];
		data_out[2] = tmp[5];
		data_out[3] = tmp[6];

		data_out[4] = tmp[8];
		data_out[5] = tmp[9];
		data_out[6] = tmp[10];
		data_out[7] = tmp[11];
		data_out[8] = tmp[12];
		data_out[9] = tmp[13];
		data_out[10] = tmp[14];

		data_out[11] = tmp[16];
		data_out[12] = tmp[17];
		data_out[13] = tmp[18];
		data_out[14] = tmp[19];
		data_out[15] = tmp[20];
		
	end

endmodule
