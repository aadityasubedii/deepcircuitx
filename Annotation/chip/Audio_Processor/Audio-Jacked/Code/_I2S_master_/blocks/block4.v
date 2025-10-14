always @ (negedge s_clk) begin
	case (PS) 
		IDLE:   begin
			DONE <= 0;
			shift_count_0 <= 0;
			shift_count_1 <= 0;
			data_out <= 0;
		end
		CHAN_0:  begin
				
			if (shift_count_0 < DIN_W-1) begin
				shift_count_0 <= shift_count_0 + 1;
				data_out <= data_in[shift_count_0];
			end
			else begin
				shift_count_0 <= 0;
				data_out <= data_in[shift_count_0];
			end
			
			if (shift_count_0 == 15) DONE <= 1;
			else DONE <= 0;
		end
		
		CHAN_1: begin
			
			if (shift_count_1 < DIN_W-1) begin
				shift_count_1 <= shift_count_1 + 1;
				data_out <= data_in[shift_count_1];
			end
			else begin
				shift_count_1 <= 0;
				data_out <= data_in[shift_count_1];
			end
			
			if (shift_count_1 == 15) DONE <= 1;
			else DONE <= 0;
		end
	endcase
end