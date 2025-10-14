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