always @ (posedge sClk or posedge start or posedge done_R )

begin

	if(start)

	begin

		 rj_EnR = 1'b0;

		  h_EnR = 1'b0;

	   x_Wr_EnR = 1'b0;

		rw_Ptr_R = 4'h0;

		hw_Ptr_R = 9'h000;

		xw_Ptr_R = 8'h00;

	end

	
	else if (done_R)

	begin

		rj_EnR = 1'b0;

		 h_EnR = 1'b0;

		 x_Wr_EnR = 1'b0;

	end



	else

	begin

		case (next_State)

			state0:

			begin   

				if(r_Clr_Stop_R == 1'b0)

				begin

					rw_Ptr_R = rw_Ptr_Buff_R;

					rj_EnR = 1'b1;

				end

				if(x_Clr_Stop_R == 1'b0)

				begin

					xw_Ptr_R = xw_Ptr_Buff_R[7:0];

					x_Wr_EnR = 1'b1;

				end

				hw_Ptr_R = hw_Ptr_Buff_R;

				h_EnR = 1'b1;	

			end

			

			state1:

			begin	

				rw_Ptr_R      = 4'h0;

			end

			

			state2:

			begin

				if(w_Ready)

				begin

					rw_Ptr_R = rw_Ptr_Buff_R;

					

					rj_WrR = 1'b1;

					rj_EnR = 1'b1;

				end

			end

			

			state3:

			begin	
				rj_WrR 		= 1'b0;

				hw_Ptr_R      = 9'h000;

			end

			

			state4:

			begin

				if(w_Ready)

				begin

					hw_Ptr_R = hw_Ptr_Buff_R;

					h_WrR = 1'b1;

					h_EnR = 1'b1;

				end

			end

			

			state5:

			begin

				h_WrR 		= 1'b0;

				xw_Ptr_R		= 8'h00;

			end

			

			state6:

			begin

				if(w_Ready)

				begin

					 xw_Ptr_R = xw_Ptr_Buff_L[7:0];

					x_Wr_EnR = 1'b1;

				end

			end

			

			state7:

			begin

				rw_Ptr_R = 4'h0;

				hw_Ptr_R = 9'h000;

				xw_Ptr_R = 8'h00;

			end

			

			state8:

			begin

				if(w_Ready)

				begin

					xw_Ptr_R = 8'h00;

					x_Wr_EnR = 1'b1;

				end

			end

			

			default:

			begin

				if (start == 1'b1)

				begin

					rw_Ptr_R = 4'h0;

					hw_Ptr_R = 9'h000;

					xw_Ptr_R = 8'h00;

				end

			end

		endcase

	end

end