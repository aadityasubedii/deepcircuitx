`timescale 1ns / 1ps
module coder
(
	input enable_i,
	input clk_i,
	input rst_i,
	input [15:0] data_i,
	output data_o 
 );

wire [15:0] comp;
wire [15:0] tmp;
reg data = 0;

assign tmp = data_i - comp;
assign data_o = tmp[15];

decoder dec
(
	.enable_i(enable_i),
	.clk_i(clk_i),
	.rst_i(rst_i),
	.data_i(data_o),
	.data_o(comp)
);

endmodule

