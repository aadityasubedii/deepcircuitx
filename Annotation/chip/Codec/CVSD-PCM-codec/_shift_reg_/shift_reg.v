`timescale 1ns / 1ps

module shift_reg(
	input enable_i,
	input clk_i,
	input rst_i,
	input data_i,
	output [3:0] data_o
);

reg [3:0] data;

always @(posedge clk_i)
	if (rst_i) 
		data <= 4'b0;
	else
		begin	
			if (enable_i)
				begin
					data <= data << 1'b1;
					data[0] <= data_i;
				end
		end

assign data_o = data;

endmodule