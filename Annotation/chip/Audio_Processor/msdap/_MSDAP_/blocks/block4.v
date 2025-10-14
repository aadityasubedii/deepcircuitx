always @ (posedge Start or posedge done_L or negedge Reset )
begin
	if(Reset == 1'b0)
	begin
		xw_ptr_buff_L = 9'h000;
		x_flagbit = 1'b0;
	end
	
	else if(Start== 1'b1)
	begin
		{R_clr_stop_L,rw_ptr_buff_L} = 5'h00;
		hw_ptr_buff_L = 9'h000;
		{X_clr_stop_L,xw_ptr_buff_L} = 9'h000;
		x_flagbit = 1'b0;
	end
	else
	begin
		case (next_state)
		state0:
			begin
				if(R_clr_stop_L == 1'b0)
				begin
					{R_clr_stop_L,rw_ptr_buff_L} =  rw_ptr_L + 1'b1;
				end		
				if(X_clr_stop_L == 1'b0)
				begin
					{X_clr_stop_L,xw_ptr_buff_L[7:0]} =  xw_ptr_L + 1'b1;
				end
				
				hw_ptr_buff_L  =  hw_ptr_L + 1'b1;
			end
			
		state1:
			begin
				rw_ptr_buff_L = 4'h0;
				xw_ptr_buff_L = 9'h000;
				hw_ptr_buff_L = 9'h000;
			end
			
		state2:
			begin
				rw_ptr_buff_L = rw_ptr_L + 1'b1;
			end
			
		state3:
			begin
				rw_ptr_buff_L = 4'h0;
			end
			
		state4:
			begin
				hw_ptr_buff_L = hw_ptr_L + 1'b1;
			end
			
		state5:
			begin
				hw_ptr_buff_L = 9'h000;
			end
			
		state6:
			begin
				if(sleep== 1'b1)
				begin
					xw_ptr_buff_L = 9'h0;
					x_flagbit = 1'b0;
				end
				else
				begin
					xw_ptr_buff_L = xw_ptr_L + 1'b1;
					if(xw_ptr_buff_L == 9'h100)
					begin
						x_flagbit = 1'b1;
					end
				end
			end
			
		state7:
			begin
				rw_ptr_buff_L = 4'h0;
				xw_ptr_buff_L = 9'h000;
				hw_ptr_buff_L = 9'h000;
			end
			
		state8:
			begin
				if(sleep == 1'b1)
				begin
					xw_ptr_buff_L = 9'h0;
				end
				else
				begin
					xw_ptr_buff_L = 9'h001;
				end
			end
			
		default:
		begin
			rw_ptr_buff_L = 4'h0;
			xw_ptr_buff_L = 9'h000;
			hw_ptr_buff_L = 9'h000;
			 R_clr_stop_L = 1'b0;
			 X_clr_stop_L = 1'b0;
		end
		endcase
	end
end