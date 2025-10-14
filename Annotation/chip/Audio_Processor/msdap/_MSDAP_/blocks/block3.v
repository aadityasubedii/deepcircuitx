always @ (posedge Start or posedge done_R or negedge Reset )
begin
	if(Reset == 1'b0)
	begin
		xw_ptr_buff_R = 9'h000;
	end
	
	else if(Start)
	begin
		{R_clr_stop_R,rw_ptr_buff_R} = 5'h0;
		hw_ptr_buff_R = 9'h000;
		{X_clr_stop_R,xw_ptr_buff_R} = 9'h000;
	end
	else
	begin
		case (next_state)
		state0:
			begin
				if(R_clr_stop_R == 1'b0)
				begin
					{R_clr_stop_R,rw_ptr_buff_R} =  rw_ptr_R + 1'b1;
				end		
				if(X_clr_stop_R == 1'b0)
				begin
					{X_clr_stop_R,xw_ptr_buff_R[7:0]} =  xw_ptr_R + 1'b1;
				end
				
				hw_ptr_buff_R  =  hw_ptr_R + 1'b1;
			end
			
		state1:
			begin
				rw_ptr_buff_R = 4'h0;
				xw_ptr_buff_R = 9'h000;
				hw_ptr_buff_R = 9'h000;
			end
			
		state2:
			begin
				rw_ptr_buff_R = rw_ptr_R + 1'b1;
			end
			
		state3:
			begin
				rw_ptr_buff_R = 4'h0;
			end
			
		state4:
			begin
				hw_ptr_buff_R = hw_ptr_R + 1'b1;
			end
			
		state5:
			begin
				hw_ptr_buff_R = 9'h000;
			end
			
		state6:
			begin
				if(sleep== 1'b1)
				begin
					xw_ptr_buff_R = 9'h000;
				end
				else
				begin
					xw_ptr_buff_R = xw_ptr_R + 1'b1;
				end
			end
			
		state7:
			begin
				rw_ptr_buff_R = 4'h0;
				xw_ptr_buff_R = 9'h000;
				hw_ptr_buff_R = 9'h000;
			end
			
		state8:
			begin
				if(sleep == 1'b1)
				begin
					xw_ptr_buff_R = 9'h000;
				end
				else
				begin
					xw_ptr_buff_R = 9'h001;
				end
			end
			
		default:
		begin
			rw_ptr_buff_R = 4'h0;
			xw_ptr_buff_R = 9'h000;
			hw_ptr_buff_R = 9'h000;
			R_clr_stop_R = 1'b0;
			X_clr_stop_R = 1'b0;
		end
		endcase
	end
end