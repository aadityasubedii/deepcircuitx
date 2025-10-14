`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//   Author: Seyed Saman Mohseni Sangtabi
//   Student number: 99210067        
//////////////////////////////////////////////////////////////////////////////////

module Coder(
	input wire [15:0] data_in,
	input wire clk,
	output wire [47:0] data_out
   );

	reg [15:0] data_in_reg;
	
	// Sequential Logic
	always @(posedge clk)
	begin
		data_in_reg <= data_in;
	end
	
	
	assign data_out = {data_in_reg, data_in_reg, data_in_reg};

endmodule
