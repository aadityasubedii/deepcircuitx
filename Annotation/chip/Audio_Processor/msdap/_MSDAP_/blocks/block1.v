always @ (posedge Sclk or posedge Start or posedge done_R )
begin
	if(Start)
	begin
		 RJ_enR = 1'b0;
		  H_enR = 1'b0;
	   X_wr_enR = 1'b0;
		rw_ptr_R = 4'h0;
		hw_ptr_R = 9'h000;
		xw_ptr_R = 8'h00;
		
	end
	
	else if (done_R)
	begin
		RJ_enR = 1'b0;
		 H_enR = 1'b0;
		 X_wr_enR = 1'b0;
	end

	else
	begin
		case (next_state)
			state0:
			begin   
				if(R_clr_stop_R == 1'b0)
				begin
					rw_ptr_R = rw_ptr_buff_R;
					RJ_enR = 1'b1;
				end
				if(X_clr_stop_R == 1'b0)
				begin
					xw_ptr_R = xw_ptr_buff_R[7:0];
					X_wr_enR = 1'b1;
				end
				hw_ptr_R = hw_ptr_buff_R;
				H_enR = 1'b1;	
			end
			
			state1:
			begin	
				rw_ptr_R      = 4'h0;
			end
			
			state2:
			begin
				if(word_ready)
				begin
					rw_ptr_R = rw_ptr_buff_R;
					
					RJ_wrR = 1'b1;
					RJ_enR = 1'b1;
				end
			end
			
			state3:
			begin	
				RJ_wrR 		= 1'b0;
				hw_ptr_R      = 9'h000;
			end
			
			state4:
			begin
				if(word_ready)
				begin
					hw_ptr_R = hw_ptr_buff_R;
					H_wrR = 1'b1;
					H_enR = 1'b1;
				end
			end
			
			state5:
			begin
				H_wrR 		= 1'b0;
				xw_ptr_R		= 8'h00;
			end
			
			state6:
			begin
				if(word_ready)
				begin
					 xw_ptr_R = xw_ptr_buff_L[7:0];
					X_wr_enR = 1'b1;
				end
			end
			
			state7:
			begin
				rw_ptr_R = 4'h0;
				hw_ptr_R = 9'h000;
				xw_ptr_R = 8'h00;
			end
			
			state8:
			begin
				if(word_ready)
				begin
					xw_ptr_R = 8'h00;
					X_wr_enR = 1'b1;
				end
			end
			
			default:
			begin
				if (Start == 1'b1)
				begin
					rw_ptr_R = 4'h0;
					hw_ptr_R = 9'h000;
					xw_ptr_R = 8'h00;
				end
			end
		endcase
	end
end