module effects
	#(parameter RESOLUTION = 24)
	(
	input data_CLK,
	input [9:0] SW,
	input [RESOLUTION-1:0] data_in,
	output [RESOLUTION-1:0] data_out
	);
	
	//Filters and Effects

//Clipping - Bit shifts data left by 1 causing increased volume and distortion
wire [RESOLUTION-1:0] L1;
clipping #(.RESOLUTION(RESOLUTION), .SHIFT(6)) clipL (.clk(data_CLK), .enable(SW[0]), .data_in(data_in), .data_out(L1));

//Echo
echo #(.RESOLUTION(RESOLUTION), .DEPTH(4096)) eL (.clk(data_CLK), .enable(SW[1]), .data_in(L1), .data_out(data_out));

endmodule
