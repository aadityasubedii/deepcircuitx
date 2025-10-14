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
				coeff_pos_L = 9'd0;				
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
					
					if (x_index_L[15] != 1'b1)
					begin
						if (h_val_L[8] == 1'b1)
							u_temp_L = u_temp_L + xin_bar_L[x_index_L % 256];
						else
							u_temp_L = u_temp_L + xin_L[x_index_L % 256];
						
					end
					coeff_pos_L = coeff_pos_L + 1'b1;
					if (k_L == (rj_temp_L - 1'b1))
					begin
						add_temp_L = y_temp_L + u_temp_L;
						
						if (add_temp_L [39] == 1'b1)
							y_temp_L = {1'b1, add_temp_L[39:1]};
						else
							y_temp_L = {1'b0, add_temp_L[39:1]};
							
						
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