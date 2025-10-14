always @ (state or Frame or word_ready or Reset or Start or prev_OutReady or word_sent or sleep)
begin
	if(Reset == 1'b0)
	begin
		next_state <= state7;
		Frame_edg <= 1'b0;
		OutReady = 1'b0;
		ALU_en = 1'b0;
		PISO_en = 1'b0;
	end
	else if (Start== 1'b1)
	begin
		ALU_en = 1'b0;
		PISO_en = 1'b0;
		OutReady = 1'b0;
		
	end
	else
	begin
		case ( state )
			state0:
			begin
				if (R_clr_stop_L && R_clr_stop_R)
				begin
					next_state <= state1;
				end
				else
				begin
					next_state <= state0;
				end
			end
				
			state1:
			begin
				if (Frame)
				begin
					next_state <= state2;
					Frame_edg  <= 1'b1;
				end
				else
				begin
					next_state <= state1;
				end
			end
			
			state2:
			begin
				if (Frame)
				begin
					Frame_edg  <= 1'b1;
				end
				else if (word_ready)
				begin
					Frame_edg  <= 1'b0;
				end
				else
				begin
					next_state <= state2;
				end
			end
			
			state3:
			begin
				if (Frame)
				begin
					next_state <= state4;
					Frame_edg  <= 1'b1;
				end
				else
				begin
					next_state <= state3;
				end
			end
			
			state4:
			begin
				if (Frame)
				begin
					Frame_edg  <= 1'b1;
				end
				else if (word_ready)
				begin
					Frame_edg  <= 1'b0;
				end
				else
				begin
					next_state <= state4;
				end
				
			end
			
			state5:
			begin
				if (Frame)
				begin
					next_state <= state6;
					Frame_edg  <= 1'b1;
				end
				else
				begin
					next_state <= state5;
				end
			end
			
			state6:
			begin
				if (Frame)
				begin
					Frame_edg  <= 1'b1;
					if (prev_OutReady)
					begin
						PISO_en = 1'b1;
						OutReady = 1'b1;
					end
					if( (|{x_flagbit,xw_ptr_buff_L}) )
					begin
						ALU_en = 1'b1;
					end
				end
				
				else if (word_ready)
				begin
					Frame_edg  <= 1'b0;
				end
				else if (prev_OutReady)
				begin
					ALU_en = 1'b0;
				end
				
				else if (word_sent)
				begin
					PISO_en = 1'b0;
					OutReady = 1'b0;
				end
				else
				begin
					next_state <= state6;
				end
				
			end
			
			state7:
			begin
				if(Reset)
				begin
					next_state <= state5;
				end
			end
			
			state8:
			begin
				if (Frame)
				begin
					Frame_edg  <= 1'b1;
					if (prev_OutReady)
					begin
						PISO_en = 1'b1;
						OutReady = 1'b1;
					end
					ALU_en = 1'b1;
				end
				
				else if (!sleep)
				begin
					ALU_en = 1'b0;
				end
				
				else if (word_ready)
				begin
					Frame_edg  <= 1'b0;
				end
				
				else if (word_sent)
				begin
					PISO_en = 1'b0;
					OutReady = 1'b0;
				end
				
				else
				begin
					next_state <= state8;
				end
			end
			
			default:
			begin
				Frame_edg <= 1'b0;
				OutReady = 1'b0;
				ALU_en = 1'b0;
				PISO_en = 1'b0;
			end
		endcase
	end
end