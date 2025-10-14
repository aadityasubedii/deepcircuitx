module audio_top 
	#(parameter RESOLUTION = 24)
(
	input SYS_CLK,
	input GPIO3, 
	input [9:0] SW,
	
	output GPIO1, GPIO2, GPIO4, GPIO0, GPIO5, GPIO6, GPIO7,
	output [9:0] LEDR
	);

	
wire MCLK, LRCK, SCLK, data_CLK, locked;
wire test_clk;
wire [RESOLUTION-1:0] data_L_in, data_R_in, data_L_out, data_R_out;

reg reset = 1'b0;



//CLOCKS
assign GPIO0 = MCLK;																						
assign GPIO1 = LRCK;																						
assign GPIO2 = SCLK;																						

PLL PL0 (reset, SYS_CLK, MCLK, locked);															//Master Clock
clock_div #(8) clk0 (MCLK, reset, SCLK);															//Data Clock
clock_div #(32) clk1 (SCLK, reset, data_CLK);													//LR Select Clock
clock_div #(64) clk2 (SCLK, reset, LRCK);															//Serial Clock
clock_div #(6400000) clk3 (MCLK, reset, test_clk);												//Test_clock



// Data Path
i2s_decode #(.RESOLUTION(RESOLUTION)) dec (.SCLK(SCLK), .LRCK(LRCK), .data_in(GPIO3), .data_out_L(data_L_in), .data_out_R(data_R_in));

wire [RESOLUTION-1:0] effects_L_out, effects_R_out;
effects #(.RESOLUTION(RESOLUTION)) eL1 (.data_CLK(data_CLK), .SW(SW), .data_in(data_R_in), .data_out(effects_L_out));
effects #(.RESOLUTION(RESOLUTION)) eR1 (.data_CLK(data_CLK), .SW(SW), .data_in(data_L_in), .data_out(effects_R_out));

flip_flop_data #(.RESOLUTION(RESOLUTION)) bp1 (.clk(!data_CLK), .data_in(effects_L_out), .data_out(data_L_out));
flip_flop_data #(.RESOLUTION(RESOLUTION)) bp2 (.clk(!data_CLK), .data_in(effects_R_out), .data_out(data_R_out));

i2s_encode #(.RESOLUTION(RESOLUTION)) enc (.SCLK(SCLK), .LRCK(LRCK), .data_in_L(data_L_out), .data_in_R(data_R_out), .data_out(GPIO4));

//TESTS
//assign LEDR[0] = test_clk;
//assign LEDR[1] = locked;
//assign GPIO4 = GPIO3;                                                             //direct bypass test
assign LEDR[9:1] = data_L_in[RESOLUTION-1:RESOLUTION-10];
assign LEDR[0] =  data_L_in[0];                                                     //data_test sight test






endmodule

