	always @(negedge Sclk)
	begin
		case (present_stateL)
			start_ini_state:
				begin
					memL_overflow <= 1'b0;
					if (Clear == 1'b1)
						next_stateL <= start_ini_state;
					else if (work_enable == 1'b1)
					begin
						next_stateL <= work_state;
						xcntL <= 8'd1;
						start_workL <= 1'b1;
						work_statusL <= 1'b1;
					end
					else
					begin
						next_stateL <= start_ini_state;
						xcntL <= xcntL;
						start_workL <= 1'b0;
					end
				end
			
			work_state:
				begin
					if (work_enable == 1'b1)
					begin
						xcntL <= xcntL + 1'b1;
						start_workL <= 1'b1;
						work_statusL <= 1'b1;
						if (xcntL == 8'hFF)
							memL_overflow <= 1'b1;
						else
							memL_overflow <= memL_overflow;
					end
					else
					begin
						start_workL <= 1'b0;
						memL_overflow <= memL_overflow;
						if (rjL_addr == 4'hF && coeffL_addr == 9'h1FF && kL == rjdataL)
							work_statusL <= 1'b0;
						else
							work_statusL <= work_statusL;
					end
					
					if (Clear == 1'b1)
						next_stateL <= start_ini_state;
					else if (sleep_flag == 1'b1)
						next_stateL <= sleep_state;
					else
						next_stateL <= work_state;
				end
			
			sleep_state:
				begin
					xcntL <= xcntL;
					memL_overflow <= memL_overflow;
					start_workL <= 1'b0;
					work_statusL <= 1'b0;
					if (Clear == 1'b1)
						next_stateL <= start_ini_state;
					else if (sleep_flag == 1'b0)
					begin
						xcntL <= xcntL + 1'b1;
						start_workL <= 1'b1;
						work_statusL <= 1'b1;
						if (xcntL == 8'hFF)
							memL_overflow <= 1'b1;
						else
							memL_overflow <= memL_overflow;
						next_stateL <= work_state;
					end
					else
						next_stateL <= sleep_state;
				end
				
			default:	next_stateL <= start_ini_state;
		endcase
	end