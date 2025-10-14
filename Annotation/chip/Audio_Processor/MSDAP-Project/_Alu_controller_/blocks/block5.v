	always @(posedge Sclk)
	begin
		
		case (pr_state_L)
			initial_state:
				begin
					xmem_overflow_L <= 1'b0;
					
					if (Clear == 1'b1) 
						next_state_L <= initial_state;
					else if (compute_enable == 1'b1)
					begin
						next_state_L <= comp_state;
						nL <= 8'd0;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
					end
					else
					begin
						next_state_L <= initial_state;
						nL <= nL;
						start_comp_L <= 1'b0;
					end
				end
			
			comp_state:
				begin
					if (compute_enable == 1'b1)
					begin
						nL <= nL + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (nL == 8'hFF)
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
					nL <= nL;
					xmem_overflow_L <= xmem_overflow_L;
					start_comp_L <= 1'b0;
					compute_status_L <= 1'b0;
					if (Clear == 1'b1)
						next_state_L <= initial_state;
					else if (sleep_flag == 1'b0)
					begin
						nL <= nL + 1'b1;
						start_comp_L <= 1'b1;
						compute_status_L <= 1'b1;
						if (nL == 8'hFF)
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
	