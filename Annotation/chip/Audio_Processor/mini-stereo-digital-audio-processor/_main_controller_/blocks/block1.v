	always @(posedge Sclk or posedge Start)
	begin
		if (Start == 1'b1)
			state_next = Start_ini;
		else
		begin
		case (state_present)
			Start_ini:	begin
							rjwrite = 4'd0;
							coeffwrite = 9'd0;
							datawrite = 8'd0;
							rj_enable = 1'b0;
							coeff_enable = 1'b0;
							data_enable = 1'b0;
							Clear = 1'b1;
							work_enable = 1'b0;
							InReady = 1'b0;
							sleep_flag = 1'b0;
							state_next = Wait_rj;
							count = 16'd0;
							count_rj = 4'd0;
							count_coeff = 9'd0;
							count_data = 8'd0;
						end
			
			Wait_rj:	begin
							rjwrite = 4'd0;
							coeffwrite = 9'd0;
							datawrite = 8'd0;
							rj_enable = 1'b0;
							coeff_enable = 1'b0;
							data_enable = 1'b0;
							Clear = 1'b0;
							work_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							count_rj = 4'd0;
							count_coeff = 9'd0;
							count_data = 8'd0;
							tk = 1'b0;
							if (Frame == 1'b1)
								state_next = Read_rj;
							else
								state_next = Wait_rj;
						end
						
			Read_rj:	begin
							coeffwrite = 9'd0;
							datawrite = 8'd0;
							coeff_enable = 1'b0;
							data_enable = 1'b0;
							Clear = 1'b0;
							work_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							count_coeff = 9'd0;
							count_data = 8'd0;
							if (in_flag == 1'b1 && tk == 1'b0)
							begin
								if (count_rj < 5'd16)
								begin
									rj_enable = 1'b1;
									rjwrite = count_rj;
									count_rj = count_rj + 1'b1;
									state_next = Read_rj;
									tk = 1'b1;
								end
								if (count_rj == 5'd16)
								begin
									state_next = Wait_coeff;
								end
								else
									state_next = Read_rj;
							end
							else if (in_flag == 1'b0)
							begin
								tk = 1'b0;
								rj_enable = 1'b0;
								rjwrite = rjwrite;
								state_next = Read_rj;
							end
							else
								state_next = Read_rj;
						end
			
			Wait_coeff: 
							begin
								rjwrite = 4'd0;
								coeffwrite = 9'd0;
								datawrite = 8'd0;
								rj_enable = 1'b0;
								coeff_enable = 1'b0;
								data_enable = 1'b0;
								Clear = 1'b0;
								work_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								count_coeff = 9'd0;
								count_data = 8'd0;
								if (Frame == 1'b1)
									state_next = Read_coeff;
								else
									state_next = Wait_coeff;
							end
						
			Read_coeff: begin
								rjwrite = 4'd0;
								datawrite = 8'd0;
								rj_enable = 1'b0;
								data_enable = 1'b0;
								Clear = 1'b0;
								work_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								count_data = 8'd0;
								if (in_flag == 1'b1 && tk == 1'b0)
								begin
									if (count_coeff < 10'h200)
									begin
										coeff_enable = 1'b1;
										coeffwrite = count_coeff;
										count_coeff = count_coeff + 1'b1;
										state_next = Read_coeff;
										tk = 1'b1;
									end
									if (count_coeff == 10'h200)
										state_next = Wait_input;
									else
										state_next = Read_coeff;
								end
								else if (in_flag == 1'b0)
								begin
									tk = 1'b0;
									coeff_enable = 1'b0;
									coeffwrite = coeffwrite;
									state_next = Read_coeff;
								end
								else
									state_next = Read_coeff;
							end

			Wait_input: begin
								rjwrite = 4'd0;
								coeffwrite = 9'd0;
								datawrite = 8'd0;
								rj_enable = 1'b0;
								coeff_enable = 1'b0;
								data_enable = 1'b0;
								Clear = 1'b0;
								work_enable = 1'b0;
								InReady = 1'b1;
								sleep_flag = 1'b0;
								count_data = 8'd0;
								if (Reset_n == 1'b0)
									state_next = Reset;
								else if (Frame == 1'b1)
									state_next = Working;
								else
									state_next = Wait_input;
							end
		
			Working:	begin
							rjwrite = 4'd0;
							coeffwrite = 9'd0;
							rj_enable = 1'b0;
							coeff_enable = 1'b0;
							Clear = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b0;
							if (Reset_n == 1'b0)
							begin
								Clear = 1'b1;
								state_next = Reset;								
							end
							else if (in_flag == 1'b1 && tk == 1'b0)
							begin
								if (flag_zeroL && flag_zeroR)
								begin
									state_next = Sleep;
									sleep_flag = 1'b1;
								end
								else
								begin
									data_enable = 1'b1;
									datawrite = count_data;
									count_data = count_data + 1'b1;
									count = count + 1'b1;
									state_next = Working;
									work_enable = 1'b1;
									tk = 1'b1;
								end
							end
							else if (in_flag == 1'b0)
							begin
								tk = 1'b0;
								data_enable = 1'b0;
								datawrite = datawrite;
								work_enable = 1'b0;
								state_next = Working;
							end
							else
							begin
								data_enable = 1'b0;
								datawrite = datawrite;
								state_next = Working;
								work_enable = 1'b0;
							end
						end
			
			Reset:	begin
							rjwrite = 4'd0;
							coeffwrite = 9'd0;
							datawrite = 8'd0;
							rj_enable = 1'b0;
							coeff_enable = 1'b0;
							data_enable = 1'b0;
							Clear = 1'b1;
							work_enable = 1'b0;
							InReady = 1'b0;
							sleep_flag = 1'b0;
							count_data = 8'd0;
							tk = 1'b0;
							if (Reset_n == 1'b0)
								state_next = Reset;
							else
								state_next = Wait_input;
						end
			
			Sleep:	begin
							rjwrite = 4'd0;
							coeffwrite = 9'd0;
							datawrite = datawrite;
							rj_enable = 1'b0;
							coeff_enable = 1'b0;
							data_enable = 1'b0;
							Clear = 1'b0;
							work_enable = 1'b0;
							InReady = 1'b1;
							sleep_flag = 1'b1;
							if (Reset_n == 1'b0)
								state_next = Reset;
							else if (in_flag == 1'b1 && tk == 1'b0)
							begin
								if (flag_zeroL && flag_zeroR)
									state_next = Sleep;
								else
								begin
									tk = 1'b1;
									data_enable = 1'b1;
									work_enable = 1'b1;
									sleep_flag = 1'b0;
									datawrite = count_data;
									count_data = count_data + 1'b1;
									count = count + 1'b1;
									state_next = Working;
								end
							end
							else
								state_next = Sleep;
						end
					
		endcase
		end
	end