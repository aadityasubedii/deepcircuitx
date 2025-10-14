always @ (posedge Sclk or negedge Reset or posedge Start or posedge done_L )
begin
	if(Reset == 1'b0)
	begin
		state <= state7;
		InReady = 1'b0;
			 n = 8'h00;
	end
	else if(Start== 1'b1)
	begin
		 RJ_enL = 1'b0;
		  H_enL = 1'b0;
	   X_wr_enL = 1'b0;
		RJ_rst = 1'b1;
		 H_rst = 1'b1;
		 X_rst = 1'b1;
		rw_ptr_L = 4'h0;
		hw_ptr_L = 9'h000;
		xw_ptr_L = 8'h00;
	  SIPO_rst = 1'b1;
			 n = 8'h00; 
		state <= state0;
	end
	
	else if (done_L== 1'b1)
	begin
		RJ_enL = 1'b0;
		 H_enL = 1'b0;
		 X_wr_enL = 1'b0;
	end

	else
	begin
		state <= next_state;
		case (next_state)
			state0:
			begin   
				SIPO_rst = 1'b0;
				if(R_clr_stop_L == 1'b0)
				begin
					rw_ptr_L = rw_ptr_buff_L;
					RJ_enL = 1'b1;
				end
				if(X_clr_stop_L == 1'b0)
				begin
					xw_ptr_L = xw_ptr_buff_L[7:0];
					X_wr_enL = 1'b1;
				end
				hw_ptr_L = hw_ptr_buff_L;
				H_enL = 1'b1;			
				if(hw_ptr_L == 9'h1FF)
				begin
					state <= state1;
				end
			end
			
			state1:
			begin	
				rw_ptr_L      = 4'h0;
				InReady     = 1'b1;
				RJ_rst      = 1'b0;
			end
			
			state2:
			begin
				if(word_ready)
				begin
					rw_ptr_L = rw_ptr_buff_L;
					if(rw_ptr_L == 4'hF)
					begin
						state <= state3;
					end
					RJ_wrL = 1'b1;
					RJ_enL = 1'b1;
				end
			end
			
			state3:
			begin	
				RJ_wrL 		= 1'b0;
				hw_ptr_L    = 9'h000;
				InReady     = 1'b1;
				 H_rst      = 1'b0;
			end
			
			state4:
			begin
				if(word_ready)
				begin
					hw_ptr_L = hw_ptr_buff_L;
					if(hw_ptr_L == 9'h1FF)
					begin
						state <= state5;
					end
					H_wrL = 1'b1;
					H_enL = 1'b1;
				end
			end
			
			state5:
			begin
				H_wrL 		= 1'b0;
				xw_ptr_L	= 8'h00;
				InReady		= 1'b1;
				X_rst		= 1'b0;
			end
			
			state6:
			begin
				if(word_ready)
				begin
					 xw_ptr_L = xw_ptr_buff_L[7:0];
						  n = xw_ptr_L;
					X_wr_enL = 1'b1;
				end
				
				if(sleep)
				begin
					state <= state8;
				end
			end
			
			state7:
			begin
				InReady = 1'b0;
					 n = 8'h00;
			end
			
			state8:
			begin
				if(word_ready)
				begin
					xw_ptr_L = 8'h0;
					X_wr_enL = 1'b1;
					n = xw_ptr_L; 
				end
				if(sleep == 1'b0)
				begin
					state <= state6;
				end
			end
			
			default:
			begin
				if (Start == 1'b1)
				begin
					rw_ptr_L = 4'h0;
					hw_ptr_L = 9'h000;
					xw_ptr_L = 8'h00;
					state <= state0;
				end
			end
		endcase
	end
end