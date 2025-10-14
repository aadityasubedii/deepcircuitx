`timescale 1ns / 1ps

module Top (input Sclk, Dclk, Start, Reset_n, InputL, InputR, Frame,
				output reg InReady,
				output OutReady,
			   output reg OutputL, OutputR);

	reg [3:0] pr_state, next_state;
	parameter [3:0] Startup = 4'd0, Wait_rj = 4'd1, Read_rj = 4'd2,
					    Wait_coeff = 4'd3, Read_coeff = 4'd4, Wait_input = 4'd5,
					    Compute = 4'd6, Reset = 4'd7, Sleep = 4'd8;

	reg [4:0] bit_count = 5'd16;
	reg input_rdy_flag = 1'b0;
	reg [15:0] data_L, data_R, data_bar_L, data_bar_R;
	
	reg [15:0] rj_L [0:15], rj_R [0:15];
	reg [4:0] rj_cnt = 5'd0;
	reg [15:0] coeff_L [0:511], coeff_R [0:511];
	reg [9:0] coeff_cnt = 10'd0;
	reg [39:0] xin_L [0:255], xin_R [0:255], xin_bar_L [0:255], xin_bar_R [0:255];
	reg [15:0] xin_cnt = 16'd0, real_count = 16'd0;
	reg compute_flag_L = 1'b0, compute_flag_R = 1'b0, wake_flag = 1'b0;
	reg [11:0] zero_cnt = 12'd0;
	integer i = 0;
	
	always @(negedge Dclk, Reset_n, Start)
	begin
		if ((Reset_n == 0) || (Start == 1'b1))
		begin
			bit_count = 5'd16;
			input_rdy_flag = 1'b0;
		end
		else
		begin
			if (Frame == 1'b1)
			begin
				bit_count = 5'd15;
				input_rdy_flag = 1'b0;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
			end
			else
			begin
				bit_count = bit_count - 1'b1;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
				if (bit_count == 5'd0)
				begin
					input_rdy_flag = 1'b1;
				end
			end
		end
	end
	
 	always @(Start, negedge Dclk)		// Sequential block
	begin
		if (Start == 1'b1)
			pr_state <= Startup;
		else
			pr_state <= next_state;
	end
	
	always @(negedge Dclk, pr_state, Reset_n)
	begin
		case (pr_state)
			Startup:	begin
							InReady = 1'b1;
							next_state = Wait_rj;
						end
			
			Wait_rj:	begin
							InReady = 1'b1;
							if (Frame == 1'b1)
								next_state = Read_rj;
							else
								next_state = Wait_rj;
						end
						
			Read_rj:	begin
							InReady = 1'b1;
							if (input_rdy_flag == 1'b1)
							begin
								if (rj_cnt < 16)
								begin
									rj_L [rj_cnt] = data_L;
									rj_R [rj_cnt] = data_R;
									rj_cnt = rj_cnt + 1'b1;
								end
							end
							if (rj_cnt == 16)
							begin
								next_state = Wait_coeff;
								//InReady = 1'b0;
							end
							else
								next_state = Read_rj;
						end
			
			Wait_coeff: begin
								InReady = 1'b1;
								if (Frame == 1'b1)
									next_state = Read_coeff;
								else
									next_state = Wait_coeff;
							end
							
			Read_coeff: begin
								InReady = 1'b1;
								if (input_rdy_flag == 1'b1)
								begin
									if (coeff_cnt <= 512)
									begin
										coeff_L [coeff_cnt] = data_L;
										coeff_R [coeff_cnt] = data_R;
										coeff_cnt = coeff_cnt + 1'b1;
									end
								end
								if (coeff_cnt == 512)
								begin
									next_state = Wait_input;
									//InReady = 1'b0;
								end
								else
									next_state = Read_coeff;
							end

			Wait_input: begin
								InReady = 1'b1;
								if (Reset_n == 1'b0)
									next_state = Reset;
								else if (Frame == 1'b1)
									next_state = Compute;
								else
									next_state = Wait_input;
							end
			
			Compute:		begin
								InReady = 1'b1;
								if (Reset_n == 1'b0)
									next_state = Reset;								
								else if (input_rdy_flag == 1'b1)
								begin
									
									if (data_L == 16'd0 && data_R == 16'd0)
										zero_cnt = zero_cnt + 1;
									else
										zero_cnt = 12'd0;
									
									if (zero_cnt == 12'd800)
										next_state = Sleep;
									else
									begin
										if (data_L[15] == 1'b1)
											xin_L [xin_cnt%256] = {8'hFF, data_L, 16'h0000};
										else
											xin_L [xin_cnt%256] = {8'h00, data_L, 16'h0000};
										
										if (data_R[15] == 1'b1)
											xin_R [xin_cnt%256] = {8'hFF, data_R, 16'h0000};
										else
											xin_R [xin_cnt%256] = {8'h00, data_R, 16'h0000};
											
										data_bar_L = ((~data_L) + 1'b1);
										data_bar_R = ((~data_R) + 1'b1);
										
										if (data_bar_L[15] == 1'b1)
											xin_bar_L [xin_cnt%256] = {8'hFF, data_bar_L, 16'h0000};
										else
											xin_bar_L [xin_cnt%256] = {8'h00, data_bar_L, 16'h0000};
										
										if (data_bar_R[15] == 1'b1)
											xin_bar_R [xin_cnt%256] = {8'hFF, data_bar_R, 16'h0000};
										else
											xin_bar_R [xin_cnt%256] = {8'h00, data_bar_R, 16'h0000};	
				
										xin_cnt = xin_cnt + 1'b1;
										real_count = real_count + 1'b1;
										next_state = Compute;
										compute_flag_L = 1'b1;
										compute_flag_R = 1'b1;
									end
								end
								else
								begin
									next_state = Compute;
									compute_flag_L = 1'b0;
									compute_flag_R = 1'b0;
									out_flag_L = 1'b0;
									out_flag_R = 1'b0;
								end
							end
			
			Reset:		begin
								InReady = 1'b0;
								compute_flag_L = 1'b0;
								compute_flag_R = 1'b0;
								compute_status_L = 1'b0;
								compute_status_R = 1'b0;
								xin_cnt = 16'hFFFF;
								real_count = real_count - 1'b1;
								x_count_L = 16'd0 - 2'b10;
								x_count_R = 16'd0 - 2'b10;
								out_flag_L = 1'b0;
								out_flag_R = 1'b0;
								for(i=0;i<256;i=i+1)
								begin
										xin_L[i] = 0;
										xin_R[i] = 0;
										xin_bar_L[i] = 0;
										xin_bar_R[i] = 0;
								end
								if (Reset_n == 1'b0)
									next_state = Reset;
								else
									next_state = Wait_input;
							end
			
			Sleep:		begin
								InReady = 1'b1;
								zero_cnt = 12'd0;
								out_flag_L = 1'b0;
								out_flag_R = 1'b0;
								if (Reset_n == 1'b0)
									next_state = Reset;
								else if (input_rdy_flag == 1'b1)
								begin
									if (data_L != 16'd0 || data_R != 16'd0)
									begin
										if (data_L[15] == 1'b1)
											xin_L [xin_cnt%256] = {8'hFF, data_L, 16'h0000};
										else
											xin_L [xin_cnt%256] = {8'h00, data_L, 16'h0000};
										
										if (data_R[15] == 1'b1)
											xin_R [xin_cnt%256] = {8'hFF, data_R, 16'h0000};
										else
											xin_R [xin_cnt%256] = {8'h00, data_R, 16'h0000};
											
										data_bar_L = ((~data_L) + 1'b1);
										data_bar_R = ((~data_R) + 1'b1);
										
										if (data_bar_L[15] == 1'b1)
											xin_bar_L [xin_cnt%256] = {8'hFF, data_bar_L, 16'h0000};
										else
											xin_bar_L [xin_cnt%256] = {8'h00, data_bar_L, 16'h0000};
										
										if (data_bar_R[15] == 1'b1)
											xin_bar_R [xin_cnt%256] = {8'hFF, data_bar_R, 16'h0000};
										else
											xin_bar_R [xin_cnt%256] = {8'h00, data_bar_R, 16'h0000};
										compute_flag_L = 1'b1;
										compute_flag_R = 1'b1;
										xin_cnt = xin_cnt + 1'b1;
										real_count = real_count + 1'b1;
										next_state = Compute;
									end
									else
										next_state = Sleep;
								end
								else
									next_state = Sleep;
							end
		endcase
	end

	reg [8:0] coeff_pos_L = 9'd0;
	reg [3:0] u_count_L = 4'd0;
	reg compute_status_L = 1'b0, out_flag_L = 1'b0; 
	reg [7:0] k_L = 8'd0;
	reg [39:0] y_temp_L = 40'd0, add_temp_L = 40'd0, u_temp_L = 40'd0;
	reg [15:0] rj_temp_L = 16'd0, x_count_L = 16'hFFFF, h_val_L = 16'd0, x_index_L = 16'd0;
	reg [39:0] out_temp_L;

	always @(negedge Sclk)
	begin
		if (Reset_n == 1'b0)
		begin
			compute_flag_L = 1'b0;
			compute_status_L = 1'b0;
			x_count_L = 1'b0;
		end
		else if (compute_flag_L == 1'b1 || compute_status_L == 1'b1)
		begin
			if (compute_flag_L == 1'b1)
			begin
				compute_flag_L = 1'b0;
				y_temp_L = 40'd0;
				out_temp_L [x_count_L] = 40'd0;
				out_flag_L = 1'b0;
				coeff_pos_L = 9'd0;				// Every time new data comes in
				u_count_L = 4'd0;
				x_count_L = x_count_L + 1'b1;
				k_L = 0;
			end
			compute_status_L = 1'b1;
			if (u_count_L < 16)
			begin
				if (k_L == 8'd0)
				begin
					u_temp_L = 40'd0;
					rj_temp_L = rj_L [u_count_L];
				end
				if (k_L < rj_temp_L)
				begin
					h_val_L = coeff_L [coeff_pos_L];
					x_index_L = x_count_L - {8'h00, h_val_L[7:0]};
					//$display ("ind %x ", x_index_L);
					if (x_index_L[15] != 1'b1)
					begin
						if (h_val_L[8] == 1'b1)
							u_temp_L = u_temp_L + xin_bar_L[x_index_L % 256];
						else
							u_temp_L = u_temp_L + xin_L[x_index_L % 256];
						//$display ("u %d %d %x %x %x", coeff_pos_R, x_count_R, h_val_R, x_index_R, u_temp_R);
					end
					coeff_pos_L = coeff_pos_L + 1'b1;
					if (k_L == (rj_temp_L - 1'b1))
					begin
						add_temp_L = y_temp_L + u_temp_L;
						
						if (add_temp_L [39] == 1'b1)
							y_temp_L = {1'b1, add_temp_L[39:1]};
						else
							y_temp_L = {1'b0, add_temp_L[39:1]};
							
						//$display ("%x", y_temp_L);
						if (u_count_L == 4'd15)
						begin
							u_count_L = 4'd0;
							out_temp_L = y_temp_L;
							$display ("%d. yL %x", (real_count), out_temp_L);
							out_flag_L = 1'b1;
							compute_status_L = 1'b0;
						end
						u_count_L = u_count_L + 1'b1;
						k_L = 0;
					end
					else
						k_L = k_L + 1'b1;
				end
			end
		end
	end
	
	reg [8:0] coeff_pos_R = 9'd0;
	reg [3:0] u_count_R = 4'd0;
	reg compute_status_R = 1'b0, out_flag_R = 1'b0; 
	reg [7:0] k_R = 8'd0;
	reg [39:0] y_temp_R = 40'd0, add_temp_R = 40'd0, u_temp_R = 40'd0;
	reg [15:0] rj_temp_R = 16'd0, x_count_R = 16'hFFFF, h_val_R = 16'd0, x_index_R = 16'd0;
	reg [39:0] out_temp_R;
	
	always @(negedge Sclk)
	begin
		if (Reset_n == 1'b0)
		begin
			compute_flag_R = 1'b0;
			compute_status_R = 1'b0;
			x_count_R = 1'b0;
		end
		else if (compute_flag_R == 1'b1 || compute_status_R == 1'b1)
		begin
			if (compute_flag_R == 1'b1)
			begin
				compute_flag_R = 1'b0;
				y_temp_R = 40'd0;
				out_temp_R [x_count_R] = 40'd0;
				out_flag_R = 1'b0;
				coeff_pos_R = 9'd0;				// Every time new data comes in
				u_count_R = 4'd0;
				x_count_R = x_count_R + 1'b1;
				k_R = 0;
			end
			compute_status_R = 1'b1;
			if (u_count_R < 16)
			begin
				if (k_R == 8'd0)
				begin
					u_temp_R = 40'd0;
					rj_temp_R = rj_R [u_count_R];
				end
				if (k_R < rj_temp_R)
				begin
					h_val_R = coeff_R [coeff_pos_R];
					x_index_R = x_count_R - {8'h00, h_val_R[7:0]};
					//$display ("ind %x ", x_index_R);
					if (x_index_R[15] != 1'b1)
					begin
						if (h_val_R[8] == 1'b1)
							u_temp_R = u_temp_R + xin_bar_R[x_index_R % 256];
						else
							u_temp_R = u_temp_R + xin_R[x_index_R % 256];
						//$display ("u %d %d %x %x %x", coeff_pos_R, x_count_R, h_val_R, x_index_R, u_temp_R);
					end
					coeff_pos_R = coeff_pos_R + 1'b1;
					if (k_R == (rj_temp_R - 1'b1))
					begin
						add_temp_R = y_temp_R + u_temp_R;
						
						if (add_temp_R [39] == 1'b1)
							y_temp_R = {1'b1, add_temp_R[39:1]};
						else
							y_temp_R = {1'b0, add_temp_R[39:1]};
							
						//$display ("k %x", y_temp_R);
						if (u_count_R == 4'd15)
						begin
							u_count_R = 4'd0;
							out_temp_R = y_temp_R;
							$display ("%d. yR %x", (real_count), out_temp_R);
							out_flag_R = 1'b1;
							//send_flag_R = 1'b0;
							compute_status_R = 1'b0;
						end
						else
							out_flag_R = 1'b0;
						u_count_R = u_count_R + 1'b1;
						k_R = 0;
					end
					else
					begin
						k_R = k_R + 1'b1;
						out_flag_R = 1'b0;
					end
				end
			end
		end
	end
	
	reg [5:0] PISO_count_L; 
	reg out_rdy_L, frame_flag_L;
	reg [39:0] piso_reg_L;
	reg OutReady_L;
	
	always @(negedge Sclk)
	begin
		if(Start == 1'b1)
		begin
			PISO_count_L = 6'd40;
			piso_reg_L = 40'd0;
			out_rdy_L = 1'b0;
			frame_flag_L = 1'b0;
			OutReady_L = 1'b0;
			OutputL = 1'b0;
		end
		else if (out_flag_L == 1'b1)
		begin
			piso_reg_L = out_temp_L;
			frame_flag_L = 1'b0;
			OutReady_L = 1'b0;
			OutputL = 1'b0;
			out_rdy_L = 1'b1;
		end
		else if (Frame == 1'b1 && out_rdy_L == 1'b1 && frame_flag_L == 1'b0)
		begin
			PISO_count_L = PISO_count_L - 1'b1;
			OutputL = piso_reg_L [PISO_count_L];
			frame_flag_L = 1'b1;
			out_rdy_L = 1'b0;
			OutReady_L = 1'b1;
		end
		else if (frame_flag_L == 1'b1)
		begin
			PISO_count_L = PISO_count_L - 1'b1;
			OutputL = piso_reg_L [PISO_count_L];
			OutReady_L = 1'b1;
			if (PISO_count_L == 6'd0)
				frame_flag_L = 1'b0;
		end
		else
		begin
			PISO_count_L = 6'd40;
			//piso_reg = 40'd0;
			//out_rdy = 1'b0;
			//frame_flag = 1'b0;
			OutputL = 1'b0;
			OutReady_L = 1'b0;
		end
	end

	reg [5:0] PISO_count_R; 
	reg out_rdy_R, frame_flag_R;
	reg [39:0] piso_reg_R;
	reg OutReady_R;
	
	always @(negedge Sclk)
	begin
		if(Start == 1'b1)
		begin
			PISO_count_R = 6'd40;
			piso_reg_R = 40'd0;
			out_rdy_R = 1'b0;
			frame_flag_R = 1'b0;
			OutReady_R = 1'b0;
			OutputR = 1'b0;
		end
		else if (out_flag_R == 1'b1)
		begin
			piso_reg_R = out_temp_R;
			frame_flag_R = 1'b0;
			OutReady_R = 1'b0;
			OutputR = 1'b0;
			out_rdy_R = 1'b1;
		end
		else if (Frame == 1'b1 && out_rdy_R == 1'b1 && frame_flag_R == 1'b0)
		begin
			PISO_count_R = PISO_count_R - 1'b1;
			OutputR = piso_reg_R [PISO_count_R];
			frame_flag_R = 1'b1;
			out_rdy_R = 1'b0;
			OutReady_R = 1'b1;
		end
		else if (frame_flag_R == 1'b1)
		begin
			PISO_count_R = PISO_count_R - 1'b1;
			OutputR = piso_reg_R [PISO_count_R];
			OutReady_R = 1'b1;
			if (PISO_count_R == 6'd0)
				frame_flag_R = 1'b0;
		end
		else
		begin
			PISO_count_R = 6'd40;
			//piso_reg = 40'd0;
			//out_rdy = 1'b0;
			//frame_flag = 1'b0;
			OutputR = 1'b0;
			OutReady_R = 1'b0;
		end
	end
	
	assign OutReady = OutReady_L && OutReady_R;
endmodule

