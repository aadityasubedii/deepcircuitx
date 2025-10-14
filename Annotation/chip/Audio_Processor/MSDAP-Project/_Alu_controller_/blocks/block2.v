	always @(posedge Sclk)
	begin
		
		case (pr_state_R)
			initial_state:
				begin
					xmem_overflow_R <= 1'b0;
					
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (compute_enable == 1'b1)
					begin
						next_state_R <= comp_state;
						nL_R <= 8'd0;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
					end
					else
					begin
						next_state_R <= initial_state;
						nL_R <= nL_R;
						start_comp_R <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)
					begin
						nL_R <= nL_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (nL_R == 8'hFF)
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
					else if (sleep_flag == 1'b1)
						next_state_R <= sleep_state;
					else
						next_state_R <= comp_state;
				end
			
			sleep_state:
				begin
					nL_R <= nL_R;
					xmem_overflow_R <= xmem_overflow_R;
					start_comp_R <= 1'b0;
					compute_status_R <= 1'b0;
					if (Clear == 1'b1)
						next_state_R <= initial_state;
					else if (sleep_flag == 1'b0)
					begin
						nL_R <= nL_R + 1'b1;
						start_comp_R <= 1'b1;
						compute_status_R <= 1'b1;
						if (nL_R == 8'hFF)
							xmem_overflow_R <= 1'b1;
						else
							xmem_overflow_R <= xmem_overflow_R;
						next_state_R <= comp_state;
					end
					else
						next_state_R <= sleep_state;
				end
				
			default:   next_state_R <= initial_state;
		endcase
	end