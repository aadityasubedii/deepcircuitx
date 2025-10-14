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
				coeff_pos_R = 9'd0;				
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
					
					if (x_index_R[15] != 1'b1)
					begin
						if (h_val_R[8] == 1'b1)
							u_temp_R = u_temp_R + xin_bar_R[x_index_R % 256];
						else
							u_temp_R = u_temp_R + xin_R[x_index_R % 256];
						
					end
					coeff_pos_R = coeff_pos_R + 1'b1;
					if (k_R == (rj_temp_R - 1'b1))
					begin
						add_temp_R = y_temp_R + u_temp_R;
						
						if (add_temp_R [39] == 1'b1)
							y_temp_R = {1'b1, add_temp_R[39:1]};
						else
							y_temp_R = {1'b0, add_temp_R[39:1]};
							
						
						if (u_count_R == 4'd15)
						begin
							u_count_R = 4'd0;
							out_temp_R = y_temp_R;
							$display ("%d. yR %x", (real_count), out_temp_R);
							out_flag_R = 1'b1;
							
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