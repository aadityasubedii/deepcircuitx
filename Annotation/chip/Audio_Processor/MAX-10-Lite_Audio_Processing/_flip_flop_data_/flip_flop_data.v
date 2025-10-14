module flip_flop_data
	#(parameter RESOLUTION = 24)
	(
	input clk,
	input [RESOLUTION - 1:0]data_in,
	output reg[RESOLUTION - 1:0]data_out

);

reg [RESOLUTION - 1:0] data_hold;

always @(posedge clk)
	begin
		data_out <= data_hold;
		data_hold <= data_in;
	end
endmodule
