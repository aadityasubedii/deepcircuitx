always @ (posedge sClk or negedge reset or posedge start or posedge done_L )

begin

	if(reset == 1'b0)

	begin

		state <= state7;

		inReady = 1'b0;

		n = 8'h00;

	end

	else if(start== 1'b1)

	begin

		rj_EnL = 1'b0;

		h_EnL = 1'b0;

		x_Wr_EnL = 1'b0;

		rj_Rst = 1'b1;

		h_Rst = 1'b1;

		x_Rst = 1'b1;

		rw_Ptr_L = 4'h0;

		hw_Ptr_L = 9'h000;

		xw_Ptr_L = 8'h00;

		parallel_Input_Rst = 1'b1;

		n = 8'h00; 

		state <= state0;

	end

	

	else if (done_L== 1'b1)

	begin

		rj_EnL = 1'b0;

		 h_EnL = 1'b0;

		 x_Wr_EnL = 1'b0;

	end



	else

	begin

		state <= next_State;

		case (next_State)

			state0:

			begin   

				parallel_Input_Rst = 1'b0;

				if(r_Clr_Stop_L == 1'b0)

				begin

					rw_Ptr_L = rw_Ptr_Buff_L;

					rj_EnL = 1'b1;

				end

				if(x_Clr_Stop_L == 1'b0)

				begin

					xw_Ptr_L = xw_Ptr_Buff_L[7:0];

					x_Wr_EnL = 1'b1;

				end

				hw_Ptr_L = hw_Ptr_Buff_L;

				h_EnL = 1'b1;			

				if(hw_Ptr_L == 9'h1FF)

				begin

					state <= state1;

				end

			end

			

			state1:

			begin	

				rw_Ptr_L      = 4'h0;

				inReady     = 1'b1;

				rj_Rst      = 1'b0;

			end

			

			state2:

			begin

				if(w_Ready)

				begin

					rw_Ptr_L = rw_Ptr_Buff_L;

					if(rw_Ptr_L == 4'hF)

					begin

						state <= state3;

					end

					rj_WrL = 1'b1;

					rj_EnL = 1'b1;

				end

			end

			

			state3:

			begin	

				rj_WrL 		= 1'b0;

				hw_Ptr_L    = 9'h000;

				inReady     = 1'b1;

				 h_Rst      = 1'b0;

			end

			

			state4:

			begin

				if(w_Ready)

				begin

					hw_Ptr_L = hw_Ptr_Buff_L;

					if(hw_Ptr_L == 9'h1FF)

					begin

						state <= state5;

					end

					h_WrL = 1'b1;

					h_EnL = 1'b1;

				end

			end

			

			state5:

			begin

				h_WrL 		= 1'b0;

				xw_Ptr_L	= 8'h00;

				inReady		= 1'b1;

				x_Rst		= 1'b0;

			end

			

			state6:

			begin

				if(w_Ready)

				begin

					 xw_Ptr_L = xw_Ptr_Buff_L[7:0];

						  n = xw_Ptr_L;

					x_Wr_EnL = 1'b1;

				end

				

				if(sleep)

				begin

					state <= state8;

				end

			end

			

			state7:

			begin

				inReady = 1'b0;

					 n = 8'h00;

			end

			

			state8:

			begin

				if(w_Ready)

				begin

					xw_Ptr_L = 8'h0;

					x_Wr_EnL = 1'b1;

					n = xw_Ptr_L; 

				end

				if(sleep == 1'b0)

				begin

					state <= state6;

				end

			end

			

			default:

			begin

				if (start == 1'b1)

				begin

					rw_Ptr_L = 4'h0;

					hw_Ptr_L = 9'h000;

					xw_Ptr_L = 8'h00;

					state <= state0;

				end

			end

		endcase

	end

end