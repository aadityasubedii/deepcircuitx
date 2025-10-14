module SIPO (Frame, Dclk, Clear, InputL, InputR, data_L, data_R, input_rdy_flag);
	input Frame, Dclk, Clear, InputL, InputR;
	output reg input_rdy_flag;
	output reg [15:0] data_L;
	output reg [15:0] data_R;
	reg [3:0] bit_count;
	reg frame_status;
