`timescale 1ns / 1ps
module CORE
(
	input DR_i,
	input clk_i,
	input rst_i,
	input [1:0] select,
	output data_o,
	output meandr_o,
	output FST_o
);

wire data_enc;
wire [15:0] uncompressed;
wire [15:0] toCompress;
wire [7:0] compressed;
wire clk;
wire enable;
wire [7:0] data;

meandr mnd
(
	.clk_i(clk_i),
	.rst_i(rst_i),
	.data_i((select[1]) ? data : compressed),
	.DR_i(DR_i),
	.clk_o(meandr_o),
	.FST_o(FST_o),
	.DT_o(data_o),
	.valid_o(enable),
	.DR_o(data)
);

Alaw_to_PCM AtoP
(
	.data_i(data),
	.data_o(uncompressed)
);

coder enc
(
	.enable_i(enable),
	.clk_i(clk_i),
	.rst_i(rst_i),
	.data_i(uncompressed),
	.data_o(data_enc)
);

decoder dec
(
	.enable_i(enable),
	.clk_i(clk_i),
	.rst_i(rst_i),
	.data_i(data_enc),
	.data_o(toCompress)
);

PCM_to_Alaw PtoA
(
	.data_i((select[0]) ? uncompressed : toCompress),
	.data_o(compressed)
);

endmodule

