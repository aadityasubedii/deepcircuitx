	always @(negedge Sclk)
	begin
		case (present_stateR)
			start_ini_state:
				begin
					memR_overflow <= 1'b0;
					if (Clear == 1'b1)
						next_stateR <= start_ini_state;
					else if (work_enable == 1'b1)
					begin
						next_stateR <= work_state;
						xcntR <= 8'd1;
						start_workR <= 1'b1;
						work_statusR <= 1'b1;
					end
					else
					begin
						next_stateR <= start_ini_state;
						xcntR <= xcntR;
						start_workR <= 1'b0;
					end
				end
			
			work_state:
				begin
					if (work_enable == 1'b1)
					begin
						xcntR <= xcntR + 1'b1;
						start_workR <= 1'b1;
						work_statusR <= 1'b1;
						if (xcntR == 8'hFF)
							memR_overflow <= 1'b1;
						else
							memR_overflow <= memR_overflow;
					end
					else
					begin
						start_workR <= 1'b0;
						memR_overflow <= memR_overflow;
						if (rjR_addr == 4'hF && coeffR_addr == 9'h1FF && kR == rjdataR)
							work_statusR <= 1'b0;
						else
							work_statusR <= work_statusR;
					end
					
					if (Clear == 1'b1)
						next_stateR <= start_ini_state;
					else
						next_stateR <= work_state;
				end
			
			sleep_state:
				begin
					xcntR <= xcntR;
					memR_overflow <= memR_overflow;
					start_workR <= 1'b0;
					work_statusR <= 1'b0;
					if (Clear == 1'b1)
						next_stateR <= start_ini_state;
					else if (sleep_flag == 1'b0)
					begin
						xcntR <= xcntR + 1'b1;
						start_workR <= 1'b1;
						work_statusR <= 1'b1;
						if (xcntR == 8'hFF)
							memR_overflow <= 1'b1;
						else
							memR_overflow <= memR_overflow;
						next_stateR <= work_state;
					end
					else
						next_stateR <= sleep_state;
				end
				
			default:
				begin
				end
		endcase
	end
	