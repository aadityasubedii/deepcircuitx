`timescale 1ns / 1ps

module comporator
(
	input [3:0] data_i,
	output data_o
);

assign data_o = (data_i == 4'b0000 || data_i == 4'b1111) ? 1 : 0;

endmodule
