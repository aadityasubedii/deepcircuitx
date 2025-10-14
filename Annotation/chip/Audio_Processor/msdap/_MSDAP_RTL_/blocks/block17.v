module MSDAP(input Dclk, Sclk, Reset_n, Frame, Start, InputL, InputR,
				 output InReady, OutReady, OutputL, OutputR);
				 
	
	wire Frame_in, Dclk_in, Clear, input_rdy_flag;
	wire [15:0] data_L, data_R;
	
	
	wire rj_en, coeff_en, data_en;				
	wire rj_en_L, coeff_en_L, xin_en_L; 		
	wire rj_en_R, coeff_en_R, xin_en_R;
	wire [3:0] rj_wr_addr, rj_addr_L, rj_addr_R;
	wire [8:0] coeff_wr_addr, coeff_addr_L, coeff_addr_R;
	wire [7:0] data_wr_addr, xin_addr_L, xin_addr_R;
	wire [15:0] rj_data_L, coeff_data_L, xin_data_L;
	wire [15:0] rj_data_R, coeff_data_R, xin_data_R;
	wire zero_flag_L, zero_flag_R;
	
	
	wire compute_enable, sleep_flag, Sclk_in;
	
	
	wire [39:0] add_inp_L, add_inp_R;
	wire add_sub_L, adder_en_L, shift_enable_L, load_L, clear_L, p2s_enable_L;
	wire add_sub_R, adder_en_R, shift_enable_R, load_R, clear_R, p2s_enable_R;
	
	
	wire [39:0] shifted_L, shifted_R, sum_L, sum_R;
	
	
	wire OutReadyL, OutReadyR;
	
	assign add_inp_L = (xin_data_L[15]) ? {8'hFF, xin_data_L, 16'h0000} : {8'h00, xin_data_L, 16'h0000};
	assign add_inp_R = (xin_data_R[15]) ? {8'hFF, xin_data_R, 16'h0000} : {8'h00, xin_data_R, 16'h0000};
	
	
	SIPO SIPO_uut (.Frame(Frame_in), .Dclk(Dclk_in), .Clear(Clear),
					.InputL(InputL), .InputR(InputR), .input_rdy_flag(input_rdy_flag),
					.data_L(data_L), .data_R(data_R));
	
	rj_memory rj_L (.wr_en(rj_en), .rd_en(rj_en_L), .Sclk(Sclk_in),
					.rj_wr_addr(rj_wr_addr), .rj_rd_addr(rj_addr_L),
					.data_in(data_L), .rj_data(rj_data_L));
	
	rj_memory rj_R (.wr_en(rj_en), .rd_en(rj_en_R), .Sclk(Sclk_in),
					.rj_wr_addr(rj_wr_addr), .rj_rd_addr(rj_addr_R),
					.data_in(data_R), .rj_data(rj_data_R));
					
	coeff_memory coeff_L (.wr_en(coeff_en), .rd_en(coeff_en_L), .Sclk(Sclk_in),
						  .coeff_wr_addr(coeff_wr_addr), .coeff_rd_addr(coeff_addr_L),
						  .data_in(data_L), .coeff_data(coeff_data_L));
	
	coeff_memory coeff_R (.wr_en(coeff_en), .rd_en(coeff_en_R), .Sclk(Sclk_in),
						  .coeff_wr_addr(coeff_wr_addr), .coeff_rd_addr(coeff_addr_R),
						  .data_in(data_R), .coeff_data(coeff_data_R));

	data_memory xin_L (.wr_en(data_en), .rd_en(xin_en_L), .Sclk(Sclk_in), .input_rdy_flag(input_rdy_flag),
					   .data_wr_addr(data_wr_addr), .data_rd_addr(xin_addr_L),
					   .data_in(data_L), .xin_data(xin_data_L), .zero_flag(zero_flag_L));

	data_memory xin_R (.wr_en(data_en), .rd_en(xin_en_R), .Sclk(Sclk_in), .input_rdy_flag(input_rdy_flag),
					   .data_wr_addr(data_wr_addr), .data_rd_addr(xin_addr_R),
					   .data_in(data_R), .xin_data(xin_data_R), .zero_flag(zero_flag_R));
					   
	MSDAP_controller main_ctrl (.Sclk(Sclk), .Dclk(Dclk), .Start(Start), .Reset_n(Reset_n),
								.Frame(Frame), .input_rdy_flag(input_rdy_flag), .zero_flag_L(zero_flag_L), .zero_flag_R(zero_flag_R),
								.rj_wr_addr(rj_wr_addr), .coeff_wr_addr(coeff_wr_addr), .data_wr_addr(data_wr_addr),
								.rj_en(rj_en), .coeff_en(coeff_en), .data_en(data_en), .Clear(Clear),
								.Frame_out(Frame_in), .Dclk_out(Dclk_in), .Sclk_out(Sclk_in),
								.compute_enable(compute_enable), .sleep_flag(sleep_flag),
								.InReady(InReady));
	
	alu_controller alu_ctrl (.compute_enable(compute_enable), .Clear(Clear), .Sclk(Sclk_in), .sleep_flag(sleep_flag),
							 .rj_data_L(rj_data_L), .coeff_data_L(coeff_data_L), .xin_data_L(xin_data_L),
							 .rj_data_R(rj_data_R), .coeff_data_R(coeff_data_R), .xin_data_R(xin_data_R),
							 .add_inp_L(add_inp_L), .add_inp_R(add_inp_R),
							 .rj_addr_L(rj_addr_L), .coeff_addr_L(coeff_addr_L), .xin_addr_L(xin_addr_L),
							 .rj_addr_R(rj_addr_R), .coeff_addr_R(coeff_addr_R), .xin_addr_R(xin_addr_R),
							 .rj_en_L(rj_en_L), .coeff_en_L(coeff_en_L), .xin_en_L(xin_en_L),
							 .rj_en_R(rj_en_R), .coeff_en_R(coeff_en_R), .xin_en_R(xin_en_R),
							 .add_sub_L(add_sub_L), .adder_en_L(adder_en_L), .shift_enable_L(shift_enable_L), .load_L(load_L), .clear_L(clear_L), .p2s_enable_L(p2s_enable_L),
							 .add_sub_R(add_sub_R), .adder_en_R(adder_en_R), .shift_enable_R(shift_enable_R), .load_R(load_R), .clear_R(clear_R), .p2s_enable_R(p2s_enable_R));
							 
	adder add_L (.a(add_inp_L), .b(shifted_L), .add_sub(add_sub_L), .adder_en(adder_en_L), .sum(sum_L));
	
	adder add_R (.a(add_inp_R), .b(shifted_R), .add_sub(add_sub_R), .adder_en(adder_en_R), .sum(sum_R));
	
	shift_acc shift_acc_L (.shift_enable(shift_enable_L), .load(load_L), .clear(clear_L), .sclk(Sclk_in), .blk_in(sum_L), .blk_out(shifted_L));
	
	shift_acc shift_acc_R (.shift_enable(shift_enable_R), .load(load_R), .clear(clear_R), .sclk(Sclk_in), .blk_in(sum_R), .blk_out(shifted_R));
	
	PISO PISO_L (.Sclk(Sclk_in), .Clear(Clear), .Frame(Frame_in), .Shifted(shifted_L), .Serial_out(OutputL), .p2s_enable(p2s_enable_L), .OutReady(OutReadyL));
	
	PISO PISO_R (.Sclk(Sclk_in), .Clear(Clear), .Frame(Frame_in), .Shifted(shifted_R), .Serial_out(OutputR), .p2s_enable(p2s_enable_R), .OutReady(OutReadyR));

	assign OutReady = OutReadyL || OutReadyR;
	
endmodule