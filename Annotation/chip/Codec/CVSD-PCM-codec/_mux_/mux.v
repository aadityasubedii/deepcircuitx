`timescale 1ns / 1ps
module mux
(
	input clk_i,
	input rst_i,
	input enable_i,
	input data_i,
	output [15:0] data_o 
);

localparam d_min = 16'd10;
localparam d_max = 16'd1280;

wire [25:0] tmp;
wire [25:0] data_max;
wire [15:0] data_min;
reg [15:0] data_stop;

assign data_min = (data_stop + d_min > d_max) ? d_max : data_stop + d_min;
assign data_max = ({data_stop, 10'b0} - tmp > {d_min, 10'b0}) ? {data_stop, 10'b0} - tmp : {d_min, 10'b0};
assign tmp = {10'b0, data_stop};
assign data_o = data_i ? data_min : data_max[25:10];

always @(posedge clk_i)
begin
	if (rst_i)
		data_stop <= 16'b0;
	else
		if (enable_i)
			data_stop <= data_o;
end


endmodule