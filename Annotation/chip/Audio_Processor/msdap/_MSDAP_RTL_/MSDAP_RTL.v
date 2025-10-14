`timescale 1ns / 1ps

module shift_acc(
    input shift_enable,
    input load,
    input clear,
    input sclk,
    input [39:0] blk_in,
    output [39:0] blk_out
    );

	reg [39:0] shift_acc_reg;
	
	always @(posedge sclk)
	begin
		if (clear)
			shift_acc_reg = 40'd0;
		if (load && shift_enable)
			shift_acc_reg = {blk_in[39], blk_in[39:1]};
		else if (load && !shift_enable)
			shift_acc_reg = blk_in;
		else
			shift_acc_reg = shift_acc_reg;
	end

	assign blk_out = shift_acc_reg;
			
endmodule

module rj_memory (input wr_en, rd_en, Sclk,
						input [3:0] rj_wr_addr, rj_rd_addr,
						input [15:0] data_in,
						output [15:0] rj_data);

	reg [15:0] rj_mem [0:15];

	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			rj_mem[rj_wr_addr] = data_in;
		else
			rj_mem[rj_wr_addr] = rj_mem[rj_wr_addr];		
	end

	assign rj_data = (rd_en) ? rj_mem[rj_rd_addr] : 16'd0;
endmodule

module PISO (Sclk, Clear, Frame, Shifted, Serial_out, p2s_enable, OutReady);
input Sclk, Clear, p2s_enable, Frame;
input [39:0] Shifted;
output reg Serial_out, OutReady;
reg [5:0] bit_count; 

reg out_rdy, frame_flag;
reg [39:0] piso_reg;

	always @(negedge Sclk)
	begin
		if(Clear == 1'b1)
		begin
			bit_count = 6'd40;
			piso_reg = 40'd0;
			out_rdy = 1'b0;
			frame_flag = 1'b0;
			OutReady = 1'b0;
			Serial_out = 1'b0;
		end
		else if (p2s_enable == 1'b1)
		begin
			piso_reg = Shifted;
			out_rdy = 1'b1;
		end
		else if (Frame == 1'b1 && out_rdy == 1'b1 && frame_flag == 1'b0)
		begin
			bit_count = bit_count - 1'b1;
			Serial_out = piso_reg [bit_count];
			frame_flag = 1'b1;
			out_rdy = 1'b0;
			OutReady = 1'b1;
		end
		else if (frame_flag == 1'b1)
		begin
			bit_count = bit_count - 1'b1;
			Serial_out = piso_reg [bit_count];
			OutReady = 1'b1;
			if (bit_count == 6'd0)
				frame_flag = 1'b0;
		end
		else
		begin
			bit_count = 6'd40;
			//piso_reg = 40'd0;
			//out_rdy = 1'b0;
			//frame_flag = 1'b0;
			Serial_out = 1'b0;
			OutReady = 1'b0;
		end
	end
endmodule

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
	
	always @(negedge Sclk or negedge Reset_n)		// Sequential block
	begin
		if (!Reset_n)
		begin
			if (pr_state > 4'd4)
				pr_state = Reset;
			else
				pr_state = next_state;
		end
		else
		pr_state = next_state;
	end
	
	always @(negedge Sclk or posedge Start)
	begin
		if (Start == 1'b1)
			next_state = Startup;
		else
		begin
		case (pr_state)
			Startup:	begin
							rj_wr_addr = 4'd0;
							coeff_wr_addr = 9'd0;
							data_wr_addr = 8'd0;
							rj_en = 1'b0;
							coeff_en = 1'b0;
							data_en = 1'b0;
							Clear = 1'b1;
							compute_enable = 1'b0;
							InReady = 1'b0;
							sleep_flag = 1'b0;
							next_state = Wait_rj;
							real_count = 16'd0;
							rj_count = 4'd0;
							coeff_count = 9'd0;
							data_count = 8'd0;
						end
			
			Wait_rj:	begin
							rj_wr_addr = 4'd0;
							coeff_wr_addr = 9'd0;
							data_wr_addr = 8'd0;
							rj_en = 1'b0;
							coeff_en = 1'b0;
							data_en = 1'b0;
							Clear = 1'b0;
							compute_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							rj_count = 4'd0;
							coeff_count = 9'd0;
							data_count = 8'd0;
							taken = 1'b0;
							if (Frame == 1'b1)
								next_state = Read_rj;
							else
								next_state = Wait_rj;
						end
						
			Read_rj:	begin
							coeff_wr_addr = 9'd0;
							data_wr_addr = 8'd0;
							coeff_en = 1'b0;
							data_en = 1'b0;
							Clear = 1'b0;
							compute_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							coeff_count = 9'd0;
							data_count = 8'd0;
							if (input_rdy_flag == 1'b1 && taken == 1'b0)
							begin
								if (rj_count < 5'd16)
								begin
									rj_en = 1'b1;
									rj_wr_addr = rj_count;
									rj_count = rj_count + 1'b1;
									next_state = Read_rj;
									taken = 1'b1;
								end
								if (rj_count == 5'd16)
								begin
									next_state = Wait_coeff;
								end
								else
									next_state = Read_rj;
							end
							else if (input_rdy_flag == 1'b0)
							begin
								taken = 1'b0;
								rj_en = 1'b0;
								rj_wr_addr = rj_wr_addr;
								next_state = Read_rj;
							end
							else
								next_state = Read_rj;
						end
			
			Wait_coeff: 
							begin
								rj_wr_addr = 4'd0;
								coeff_wr_addr = 9'd0;
								data_wr_addr = 8'd0;
								rj_en = 1'b0;
								coeff_en = 1'b0;
								data_en = 1'b0;
								Clear = 1'b0;
								compute_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								coeff_count = 9'd0;
								data_count = 8'd0;
								if (Frame == 1'b1)
									next_state = Read_coeff;
								else
									next_state = Wait_coeff;
							end
						
			Read_coeff: begin
								rj_wr_addr = 4'd0;
								data_wr_addr = 8'd0;
								rj_en = 1'b0;
								data_en = 1'b0;
								Clear = 1'b0;
								compute_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								data_count = 8'd0;
								if (input_rdy_flag == 1'b1 && taken == 1'b0)
								begin
									if (coeff_count < 10'h200)
									begin
										coeff_en = 1'b1;
										coeff_wr_addr = coeff_count;
										coeff_count = coeff_count + 1'b1;
										next_state = Read_coeff;
										taken = 1'b1;
									end
									if (coeff_count == 10'h200)
										next_state = Wait_input;
									else
										next_state = Read_coeff;
								end
								else if (input_rdy_flag == 1'b0)
								begin
									taken = 1'b0;
									coeff_en = 1'b0;
									coeff_wr_addr = coeff_wr_addr;
									next_state = Read_coeff;
								end
								else
									next_state = Read_coeff;
							end

			Wait_input: begin
								rj_wr_addr = 4'd0;
								coeff_wr_addr = 9'd0;
								data_wr_addr = 8'd0;
								rj_en = 1'b0;
								coeff_en = 1'b0;
								data_en = 1'b0;
								Clear = 1'b0;
								compute_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								data_count = 8'd0;
								if (Reset_n == 1'b0)
									next_state = Reset;
								else if (Frame == 1'b1)
									next_state = Compute;
								else
									next_state = Wait_input;
							end
		
			Compute:	begin
							rj_wr_addr = 4'd0;
							coeff_wr_addr = 9'd0;
							rj_en = 1'b0;
							coeff_en = 1'b0;
							Clear = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							if (Reset_n == 1'b0)
							begin
								Clear = 1'b1;
								next_state = Reset;								
							end
							else if (input_rdy_flag == 1'b1 && taken == 1'b0)
							begin
								if (zero_flag_L && zero_flag_R)
								begin
									next_state = Sleep;
									sleep_flag = 1'b1;
								end
								else
								begin
									data_en = 1'b1;
									data_wr_addr = data_count;
									data_count = data_count + 1'b1;
									real_count = real_count + 1'b1;
									next_state = Compute;
									compute_enable = 1'b1;
									taken = 1'b1;
								end
							end
							else if (input_rdy_flag == 1'b0)
							begin
								taken = 1'b0;
								data_en = 1'b0;
								data_wr_addr = data_wr_addr;
								compute_enable = 1'b0;
								next_state = Compute;
							end
							else
							begin
								data_en = 1'b0;
								data_wr_addr = data_wr_addr;
								//real_count = real_count + 1'b1;
								next_state = Compute;
								compute_enable = 1'b0;
							end
						end
			
			Reset:	begin
							rj_wr_addr = 4'd0;
							coeff_wr_addr = 9'd0;
							data_wr_addr = 8'd0;
							rj_en = 1'b0;
							coeff_en = 1'b0;
							data_en = 1'b0;
							Clear = 1'b1;
							compute_enable = 1'b0;
							InReady = 1'b0;
							sleep_flag = 1'b0;
							data_count = 8'd0;
							taken = 1'b0;
							//real_count = real_count - 1'b1;
							if (Reset_n == 1'b0)
								next_state = Reset;
							else
								next_state = Wait_input;
						end
			
			Sleep:	begin
							rj_wr_addr = 4'd0;
							coeff_wr_addr = 9'd0;
							data_wr_addr = data_wr_addr;
							rj_en = 1'b0;
							coeff_en = 1'b0;
							data_en = 1'b0;
							Clear = 1'b0;
							compute_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b1;
							if (Reset_n == 1'b0)
								next_state = Reset;
							else if (input_rdy_flag == 1'b1 && taken == 1'b0)
							begin
								if (zero_flag_L && zero_flag_R)
									next_state = Sleep;
								else
								begin
									taken = 1'b1;
									data_en = 1'b1;
									compute_enable = 1'b1;
									sleep_flag = 1'b0;
									data_wr_addr = data_count;
									data_count = data_count + 1'b1;
									real_count = real_count + 1'b1;
									next_state = Compute;
								end
							end
							else
								next_state = Sleep;
						end
					
		endcase
		end
	end
endmodule

module MSDAP(input Dclk, Sclk, Reset_n, Frame, Start, InputL, InputR,
				 output InReady, OutReady, OutputL, OutputR);
				 
	//Wires for SIPO
	wire Frame_in, Dclk_in, Clear, input_rdy_flag;
	wire [15:0] data_L, data_R;
	
	//Wires for memories
	wire rj_en, coeff_en, data_en;				// For main controller
	wire rj_en_L, coeff_en_L, xin_en_L; 		// For ALU controller
	wire rj_en_R, coeff_en_R, xin_en_R;
	wire [3:0] rj_wr_addr, rj_addr_L, rj_addr_R;
	wire [8:0] coeff_wr_addr, coeff_addr_L, coeff_addr_R;
	wire [7:0] data_wr_addr, xin_addr_L, xin_addr_R;
	wire [15:0] rj_data_L, coeff_data_L, xin_data_L;
	wire [15:0] rj_data_R, coeff_data_R, xin_data_R;
	wire zero_flag_L, zero_flag_R;
	
	//Wires for main controller
	wire compute_enable, sleep_flag, Sclk_in;
	
	//Wires for ALU controller
	wire [39:0] add_inp_L, add_inp_R;
	wire add_sub_L, adder_en_L, shift_enable_L, load_L, clear_L, p2s_enable_L;
	wire add_sub_R, adder_en_R, shift_enable_R, load_R, clear_R, p2s_enable_R;
	
	//Wires for adder, shifter blocks
	wire [39:0] shifted_L, shifted_R, sum_L, sum_R;
	
	//Wires for PISO
	wire OutReadyL, OutReadyR;
	
	assign add_inp_L = (xin_data_L[15]) ? {8'hFF, xin_data_L, 16'h0000} : {8'h00, xin_data_L, 16'h0000};
	assign add_inp_R = (xin_data_R[15]) ? {8'hFF, xin_data_R, 16'h0000} : {8'h00, xin_data_R, 16'h0000};
	
	//Module instantiations
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

module data_memory (input wr_en, rd_en, Sclk, input_rdy_flag,
					input [7:0] data_wr_addr, data_rd_addr,
					input [15:0] data_in,
					output [15:0] xin_data,
					output reg zero_flag);

	reg [15:0] data_mem [0:255];
	reg [11:0] zero_cnt;
	
	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			data_mem[data_wr_addr] = data_in;
		else
			data_mem[data_wr_addr] = data_mem[data_wr_addr];
	end

	always @(posedge input_rdy_flag)
	begin
		if (data_in == 16'd0)
		begin
			zero_cnt = zero_cnt + 1'b1;
			if (zero_cnt == 12'd800)
				zero_flag = 1'b1;
			else if (zero_cnt > 12'd800)
			begin
				zero_cnt = 12'd800;
				zero_flag = 1'b1;
			end
		end		
		else if (data_in != 16'd0)
		begin
			zero_cnt = 12'd0;
			zero_flag = 1'b0;
		end
	end

	assign xin_data = (rd_en) ? data_mem[data_rd_addr] : 16'd0;
endmodule

module coeff_memory (input wr_en, rd_en, Sclk,
							input [8:0] coeff_wr_addr, coeff_rd_addr,
							input [15:0] data_in,
							output [15:0] coeff_data);

	reg [15:0] coeff_mem [0:511];

	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			coeff_mem[coeff_wr_addr] = data_in;
		else
			coeff_mem[coeff_wr_addr] = coeff_mem[coeff_wr_addr];		
	end

	assign coeff_data = (rd_en) ? coeff_mem[coeff_rd_addr] : 16'd0;
endmodule

module alu_controller (
	input compute_enable,
	input Clear,
	input Sclk,
	input sleep_flag,
	
	input [15:0] rj_data_L, coeff_data_L, xin_data_L,
	input [15:0] rj_data_R, coeff_data_R, xin_data_R,
	
	output [39:0] add_inp_L, add_inp_R,
	
	output reg [3:0] rj_addr_L,
	output reg [8:0] coeff_addr_L,
	output reg [7:0] xin_addr_L,
	
	output reg [3:0] rj_addr_R,
	output reg [8:0] coeff_addr_R,
	output reg [7:0] xin_addr_R,
	
	output reg rj_en_L, coeff_en_L, xin_en_L,
	output reg rj_en_R, coeff_en_R, xin_en_R,
	
	output reg add_sub_L, adder_en_L, shift_enable_L, load_L, clear_L, p2s_enable_L,
	output reg add_sub_R, adder_en_R, shift_enable_R, load_R, clear_R, p2s_enable_R
	);
	
	parameter initial_state = 2'b00, comp_state = 2'b01, sleep_state = 2'b10;
	
	reg [1:0] pr_state_L, next_state_L;
	reg [1:0] pr_state_R, next_state_R;
	
	reg [7:0] x_count_L, x_index_L;
	reg [7:0] x_count_R, x_index_R;
	
	reg [7:0] k_L, k_R;
	
	reg xmem_overflow_L, start_comp_L, compute_status_L, out_done_L;
	reg xmem_overflow_R, start_comp_R, compute_status_R, out_done_R;
	
	//wire [39:0] shifted_L, shifted_R, sum_L, sum_R;	
	
	assign add_inp_L = (xin_data_L[15]) ? {8'hFF, xin_data_L, 16'h0000} : {8'h00, xin_data_L, 16'h0000};
	assign add_inp_R = (xin_data_R[15]) ? {8'hFF, xin_data_R, 16'h0000} : {8'h00, xin_data_R, 16'h0000};
	
		
	always @(Clear, next_state_L)
	begin
		if (Clear == 1'b1)
			pr_state_L <= initial_state;
		else
			pr_state_L <= next_state_L;
	end
	
	always @(posedge Sclk)
	begin
		//next_state_L <= initial_state;
		case (pr_state_L)
			initial_state:
				begin
					xmem_overflow_L <= 1'b0;
					//out_done_L = 1'b0;
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (compute_enable == 1'b1)
					begin
						next_state_L <= comp_state;
						x_count_L <= 8'd1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
					end
					else
					begin
						next_state_L <= initial_state;
						x_count_L <= x_count_L;
						start_comp_L <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)
					begin
						x_count_L <= x_count_L + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (x_count_L == 8'hFF)
							xmem_overflow_L <= 1'b1;
						else
							xmem_overflow_L <= xmem_overflow_L;
					end
					else
					begin
						start_comp_L <= 1'b0;
						xmem_overflow_L <= xmem_overflow_L;
						if (rj_addr_L == 4'hF && coeff_addr_L == 9'h1FF && k_L == rj_data_L)
							compute_status_L <= 1'b0;
						else
							compute_status_L <= compute_status_L;
					end
					
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (sleep_flag == 1'b1)
						next_state_L <= sleep_state;
					else
						next_state_L <= comp_state;
				end
			
			sleep_state:
				begin
					x_count_L <= x_count_L;
					xmem_overflow_L <= xmem_overflow_L;
					start_comp_L <= 1'b0;
					compute_status_L <= 1'b0;
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (sleep_flag == 1'b0)
					begin
						x_count_L <= x_count_L + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (x_count_L == 8'hFF)
							xmem_overflow_L <= 1'b1;
						else
							xmem_overflow_L <= xmem_overflow_L;
						next_state_L <= comp_state;
					end
					else
						next_state_L <= sleep_state;
				end
				
			default:	next_state_L <= initial_state;
		endcase
	end
	
	always @(posedge Sclk)
	begin
		if (out_done_L)
		begin
			p2s_enable_L = 1'b1;
			rj_addr_L = 4'd0;
			coeff_addr_L = 9'd0;
			k_L = 8'd0;
			out_done_L = 1'b0;
			clear_L = 1'b1;
		end
		else
			p2s_enable_L = 1'b0;
		
		if (start_comp_L == 1'b1)
		begin
			out_done_L = 1'b0;
			rj_addr_L = 4'd0;
			rj_en_L = 1'b1;
			coeff_addr_L = 9'd0;
			coeff_en_L = 1'b1;
			xin_en_L = 1'b0;
			adder_en_L = 1'b0;
			shift_enable_L = 1'b0;
			k_L = 8'd0;
			clear_L = 1'b1;
			load_L = 1'b0;
		end
		else if (compute_status_L == 1'b1)
		begin
			if (k_L == rj_data_L)
			begin
				xin_en_L = 1'b0;
				shift_enable_L = 1'b1;
				clear_L = 1'b0;
				load_L = 1'b1;
				adder_en_L = 1'b1;
				k_L = 8'd0;
				if (rj_addr_L < 4'd15)
				begin
					rj_addr_L = rj_addr_L + 1'b1;
				end
				else
				begin
					rj_addr_L = 4'd0;
					out_done_L = 1'b1;
					coeff_addr_L = 9'd0;
				end
			end
			else
			begin
				shift_enable_L = 1'b0;
				clear_L = 1'b0;
				load_L = 1'b0;
				xin_en_L = 1'b0;
				x_index_L = coeff_data_L[7:0];
				add_sub_L = coeff_data_L[8];
				if (x_count_L - 1'b1 >= x_index_L)
				begin
					xin_addr_L = x_count_L - 1'b1 - x_index_L;
					xin_en_L = 1'b1;
					adder_en_L = 1'b1;
					load_L = 1'b1;
				end
				else if (x_count_L - 1'b1 < x_index_L && xmem_overflow_L == 1'b1)
				begin
					xin_addr_L = x_count_L - 1'b1 + (9'd256 - x_index_L);
					xin_en_L = 1'b1;
					adder_en_L = 1'b1;
					load_L = 1'b1;
				end
				else
				begin
					xin_addr_L = xin_addr_L;
					adder_en_L = 1'b0;
				end
				
				if (coeff_addr_L < 9'h1FF)
					coeff_addr_L = coeff_addr_L + 1'b1;
				else
					coeff_addr_L = coeff_addr_L;
				
				k_L = k_L + 1'b1;
			end
		end
		else
		begin
			rj_addr_L = 4'd0;
			rj_en_L = 1'b0;
			coeff_addr_L = 9'd0;
			coeff_en_L = 1'b0;
			xin_en_L = 1'b0;
			adder_en_L = 1'b0;
			shift_enable_L = 1'b0;
			k_L = 8'd0;
			load_L = 1'b0;
			clear_L = 1'b1;
		end
	end
	
	/*always @ (negedge p2s_enable_L)
	begin
			$display("%d : %X \n",x_count_L,shifted_L);
	end*/
	
	
	// Right side FSM
	
	always @(Clear, next_state_R)
	begin
		if (Clear == 1'b1)
			pr_state_R <= initial_state;
		else
			pr_state_R <= next_state_R;
	end
	
	always @(posedge Sclk)
	begin
		//next_state_R <= initial_state;
		case (pr_state_R)
			initial_state:
				begin
					xmem_overflow_R <= 1'b0;
					//out_done_R = 1'b0;
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (compute_enable == 1'b1)
					begin
						next_state_R <= comp_state;
						x_count_R <= 8'd1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
					end
					else
					begin
						next_state_R <= initial_state;
						x_count_R <= x_count_R;
						start_comp_R <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)
					begin
						x_count_R <= x_count_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (x_count_R == 8'hFF)
							xmem_overflow_R <= 1'b1;
						else
							xmem_overflow_R <= xmem_overflow_R;
					end
					else
					begin
						start_comp_R <= 1'b0;
						xmem_overflow_R <= xmem_overflow_R;
						if (rj_addr_R == 4'hF && coeff_addr_R == 9'h1FF && k_R == rj_data_R)
							compute_status_R <= 1'b0;
						else
							compute_status_R <= compute_status_R;
					end
					
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					//else if (sleep_flag == 1'b1)
					//	next_state_R <= sleep_state;
					else
						next_state_R <= comp_state;
				end
			
			sleep_state:
				begin
					x_count_R <= x_count_R;
					xmem_overflow_R <= xmem_overflow_R;
					start_comp_R <= 1'b0;
					compute_status_R <= 1'b0;
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (sleep_flag == 1'b0)
					begin
						x_count_R <= x_count_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (x_count_R == 8'hFF)
							xmem_overflow_R <= 1'b1;
						else
							xmem_overflow_R <= xmem_overflow_R;
						next_state_R <= comp_state;
					end
					else
						next_state_R <= sleep_state;
				end
				
			default:
				begin
				end
		endcase
	end
	
	always @(posedge Sclk)
	begin
		if (out_done_R)
		begin
			p2s_enable_R = 1'b1;
			rj_addr_R = 4'd0;
			coeff_addr_R = 9'd0;
			k_R = 8'd0;
			out_done_R = 1'b0;
		end
		else
			p2s_enable_R = 1'b0;
		
		if (start_comp_R == 1'b1)
		begin
			out_done_R = 1'b0;
			rj_addr_R = 4'd0;
			rj_en_R = 1'b1;
			coeff_addr_R = 9'd0;
			coeff_en_R = 1'b1;
			xin_en_R = 1'b0;
			adder_en_R = 1'b0;
			shift_enable_R = 1'b0;
			k_R = 8'd0;
			clear_R = 1'b1;
			load_R = 1'b0;
		end
		else if (compute_status_R == 1'b1)
		begin
			if (k_R == rj_data_R)
			begin
				xin_en_R = 1'b0;
				shift_enable_R = 1'b1;
				clear_R = 1'b0;
				load_R = 1'b1;
				adder_en_R = 1'b1;
				k_R = 8'd0;
				if (rj_addr_R < 4'd15)
				begin
					rj_addr_R = rj_addr_R + 1'b1;
				end
				else
				begin
					rj_addr_R = 4'd0;
					out_done_R = 1'b1;
					coeff_addr_R = 9'd0;
				end
			end
			else
			begin
				shift_enable_R = 1'b0;
				clear_R = 1'b0;
				load_R = 1'b0;
				xin_en_R = 1'b0;
				x_index_R = coeff_data_R[7:0];
				add_sub_R = coeff_data_R[8];
				if (x_count_R - 1'b1 >= x_index_R)
				begin
					xin_addr_R = x_count_R - 1'b1 - x_index_R;
					xin_en_R = 1'b1;
					adder_en_R = 1'b1;
					load_R = 1'b1;
				end
				else if (x_count_R - 1'b1 < x_index_R && xmem_overflow_R == 1'b1)
				begin
					xin_addr_R = x_count_R - 1'b1 + (9'd256 - x_index_R);
					xin_en_R = 1'b1;
					adder_en_R = 1'b1;
					load_R = 1'b1;
				end
				else
				begin
					xin_addr_R = xin_addr_R;
					adder_en_R = 1'b0;
				end
				
				if (coeff_addr_R < 9'h1FF)
					coeff_addr_R = coeff_addr_R + 1'b1;
				else
					coeff_addr_R = coeff_addr_R;
				
				k_R = k_R + 1'b1;
			end
		end
		else
		begin
			rj_addr_R = 4'd0;
			rj_en_R = 1'b0;
			coeff_addr_R = 9'd0;
			coeff_en_R = 1'b0;
			xin_en_R = 1'b0;
			adder_en_R = 1'b0;
			shift_enable_R = 1'b0;
			k_R = 8'd0;
			load_R = 1'b0;
			clear_R = 1'b1;
		end
	end
	
	/*always @ (negedge p2s_enable_R)
	begin
			$display("%d : %X \n",x_count_R,shifted_R);
	end*/
	
endmodule

module adder(
	input [39:0] a,
    input [39:0] b,
    input add_sub,
	input adder_en,
    output [39:0] sum
    );

		assign sum = (add_sub == 1'b1) ? (b - a) : 
						 (add_sub == 1'b0) ? (b + a) :
						 	sum;	

endmodule

module SIPO (Frame, Dclk, Clear, InputL, InputR, data_L, data_R, input_rdy_flag);
	input Frame, Dclk, Clear, InputL, InputR;
	output reg input_rdy_flag;
	output reg [15:0] data_L;
	output reg [15:0] data_R;
	reg [3:0] bit_count;
	reg frame_status;

	always @(negedge Dclk or posedge Clear)
	begin
		if (Clear == 1'b1)
		begin
			bit_count = 4'd15;
			//temp_L = 16'd0;
			//temp_R = 16'd0;
			data_L = 16'd0;
			data_R = 16'd0;			
			input_rdy_flag = 1'b0;
			frame_status = 1'b0;
		end
		else 
		begin
			if (Frame == 1'b1)
			begin
				bit_count = 4'd15;
				input_rdy_flag = 1'b0;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
				frame_status = 1'b1;
			end
			else if (frame_status == 1'b1)
			begin
				bit_count = bit_count - 1'b1;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
				if (bit_count == 4'd0)
				begin
					//data_L = temp_L;
					//data_R = temp_R;					
					input_rdy_flag = 1'b1;
					frame_status = 1'b0;
				end
				else
				begin
					//data_L = data_L;
					//data_R = data_R;
					input_rdy_flag = 1'b0;
					frame_status = 1'b1;
				end
			end
			else
			begin
				bit_count = 4'd15;
				data_L = 16'd0;
				data_R = 16'd0;			
				input_rdy_flag = 1'b0;
				frame_status = 1'b0;
			end
		end
	end
endmodule
