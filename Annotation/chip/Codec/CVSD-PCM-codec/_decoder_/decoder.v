`timescale 1ns / 1ps

module decoder(
	input enable_i,
	input clk_i,
	input rst_i,
	input data_i,
	output [15:0] data_o
);

wire [3:0] reg_out;
wire comp_out;
wire [15:0] step_out;


shift_reg shift
(
	.enable_i(enable_i),
	.clk_i(clk_i), 
	.rst_i(rst_i), 
	.data_i(data_i),
	.data_o(reg_out)
);

comporator comp
(
	.data_i(reg_out), 
	.data_o(comp_out)
);

mux step_size_control
(
	.clk_i(clk_i),
	.rst_i(rst_i),
	.enable_i(enable_i),
	.data_i(comp_out),
	.data_o(step_out) 
);

accumulator accum
(
	.clk_i(clk_i), 
	.rst_i(rst_i),
	.enable_i(enable_i),
	.data_i(step_out),
	.b_i(data_i),
	.data_o(data_o)
);

endmodule
