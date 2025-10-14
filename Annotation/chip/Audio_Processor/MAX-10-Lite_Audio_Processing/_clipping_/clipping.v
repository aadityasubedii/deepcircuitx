module clipping
	#(parameter RESOLUTION = 24,
	SHIFT = 4)
	(
	input clk, enable,
	input [RESOLUTION - 1:0]data_in,
	output reg[RESOLUTION - 1:0]data_out

);

	always @(posedge clk)
		begin
			if (!enable)
				data_out <= data_in;
			else begin
				data_out[RESOLUTION - SHIFT - 1] <= |data_in[RESOLUTION-1:RESOLUTION - SHIFT - 1];
				data_out <= data_in << SHIFT;
			end
		end
endmodule
