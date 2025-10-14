`timescale 1ns / 1ps

module accumulator
(
	input clk_i,
	input rst_i,
	input enable_i,
	input [15:0] data_i,
	input b_i,
	output [15:0] data_o
);

localparam signed y_min17 = -17'd32767;
localparam signed y_min16 = -16'd32767;
localparam signed y_max = 17'd32767;

wire signed [15:0] data_max; // if y >= 0
wire signed [15:0] data_min; // if y < 0
reg signed [16:0] data_tmp = 0; // for d-tg
wire signed [20:0] data; //for output
wire signed [16:0] data_y;
wire signed [20:0] data_stop;

assign data_y = (b_i == 0) ? {data_o[15], data_o} + data_i : 18'd131072 - data_i + {data_o[15], data_o};
assign data_min = (data_tmp > y_max) ? y_max : data_tmp[15:0];
assign data_max = (data_tmp > y_min17) ? data_tmp[15:0]: y_min16;
//min max
assign data_stop = (data_tmp >= 0) ? {data_min, 5'b0} : {data_max, 5'b0};
assign data = (data_tmp >= 0) ? data_stop - data_min : data_stop - data_max;

always @(posedge clk_i)
begin
	if (rst_i)
		data_tmp <= 0;
	else
		if (enable_i)
			data_tmp <= data_y;
end

assign data_o = data[20:5];

endmodule
