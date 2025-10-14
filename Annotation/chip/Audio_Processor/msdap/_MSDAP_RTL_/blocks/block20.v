module MSDAP_controller (input Sclk, Dclk, Start, Reset_n, Frame, input_rdy_flag, zero_flag_L, zero_flag_R,
								 output reg [3:0] rj_wr_addr,
						       output reg [8:0] coeff_wr_addr,
						       output reg [7:0] data_wr_addr,
						       output reg rj_en, coeff_en, data_en, Clear,
						       output Frame_out, Dclk_out, Sclk_out,
						       output reg compute_enable, sleep_flag, InReady);
	
	parameter [3:0] Startup = 4'd0, Wait_rj = 4'd1, Read_rj = 4'd2,
					    Wait_coeff = 4'd3, Read_coeff = 4'd4, Wait_input = 4'd5,
					    Compute = 4'd6, Reset = 4'd7, Sleep = 4'd8;
   
	reg [3:0] pr_state, next_state;
	reg [15:0] real_count;

	reg [4:0] rj_count;
	reg [9:0] coeff_count;
	reg [7:0] data_count;
	
	reg taken;
	
	assign Frame_out = Frame;
	assign Dclk_out = Dclk;
	assign Sclk_out = Sclk;
	