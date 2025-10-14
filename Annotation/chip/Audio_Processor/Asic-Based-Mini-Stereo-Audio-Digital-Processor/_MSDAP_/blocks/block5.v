always @ (posedge start or posedge done_L or negedge reset )

begin

	if(reset == 1'b0)

	begin

		xw_Ptr_Buff_L = 9'h000;

		x_FlagBit = 1'b0;

	end

	

	else if(start== 1'b1)

	begin

		{r_Clr_Stop_L,rw_Ptr_Buff_L} = 5'h00;

		hw_Ptr_Buff_L = 9'h000;

		{x_Clr_Stop_L,xw_Ptr_Buff_L} = 9'h000;

		x_FlagBit = 1'b0;

	end

	else

	begin

		case (next_State)

		state0:

			begin

				if(r_Clr_Stop_L == 1'b0)

				begin

					{r_Clr_Stop_L,rw_Ptr_Buff_L} =  rw_Ptr_L + 1'b1;

				end		

				if(x_Clr_Stop_L == 1'b0)

				begin

					{x_Clr_Stop_L,xw_Ptr_Buff_L[7:0]} =  xw_Ptr_L + 1'b1;

				end

				

				hw_Ptr_Buff_L  =  hw_Ptr_L + 1'b1;

			end

			

		state1:

			begin

				rw_Ptr_Buff_L = 4'h0;

				xw_Ptr_Buff_L = 9'h000;

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state2:

			begin

				rw_Ptr_Buff_L = rw_Ptr_L + 1'b1;

			end

			

		state3:

			begin

				rw_Ptr_Buff_L = 4'h0;

			end

			

		state4:

			begin

				hw_Ptr_Buff_L = hw_Ptr_L + 1'b1;

			end

			

		state5:

			begin

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state6:

			begin

				if(sleep== 1'b1)

				begin

					xw_Ptr_Buff_L = 9'h0;

					x_FlagBit = 1'b0;

				end

				else

				begin

					xw_Ptr_Buff_L = xw_Ptr_L + 1'b1;

					if(xw_Ptr_Buff_L == 9'h100)

					begin

						x_FlagBit = 1'b1;

					end

				end

			end

			

		state7:

			begin

				rw_Ptr_Buff_L = 4'h0;

				xw_Ptr_Buff_L = 9'h000;

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state8:

			begin

				if(sleep == 1'b1)

				begin

					xw_Ptr_Buff_L = 9'h0;

				end

				else

				begin

					xw_Ptr_Buff_L = 9'h001;

				end

			end

			

		default:

		begin

			rw_Ptr_Buff_L = 4'h0;

			xw_Ptr_Buff_L = 9'h000;

			hw_Ptr_Buff_L = 9'h000;

			 r_Clr_Stop_L = 1'b0;

			 x_Clr_Stop_L = 1'b0;

		end

		endcase

	end

end