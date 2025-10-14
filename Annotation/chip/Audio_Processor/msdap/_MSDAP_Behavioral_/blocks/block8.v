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