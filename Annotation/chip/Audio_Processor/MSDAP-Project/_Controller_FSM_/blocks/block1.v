	always @(posedge Sclk or posedge Start)
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
				default: next_state = 4'
					
		endcase
		end
	end