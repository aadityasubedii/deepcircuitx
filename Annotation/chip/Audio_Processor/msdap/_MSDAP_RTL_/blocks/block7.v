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