always @ (state or frame or w_Ready or reset or start or prev_OutReady or word_Sent or sleep)

begin

	if(reset == 1'b0)

	begin

		next_State <= state7;

		frame_Edg <= 1'b0;

		outReady = 1'b0;

		ALU_En = 1'b0;

		serial_Output_En = 1'b0;

	end

	else if (start== 1'b1)

	begin

		ALU_En = 1'b0;

		serial_Output_En = 1'b0;

		outReady = 1'b0;

	end

	else

	begin

		case ( state )

			state0:

			begin

				if (r_Clr_Stop_L && r_Clr_Stop_R)

				begin

					next_State <= state1;

				end

				else

				begin

					next_State <= state0;

				end

			end

				

			state1:

			begin

				if (frame)

				begin

					next_State <= state2;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state1;

				end

			end

			

			state2:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

				end

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else

				begin

					next_State <= state2;

				end

			end

			

			state3:

			begin

				if (frame)

				begin

					next_State <= state4;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state3;

				end

			end

			

			state4:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

				end

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else

				begin

					next_State <= state4;

				end


			end

			

			state5:

			begin

				if (frame)

				begin

					next_State <= state6;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state5;

				end

			end

			

			state6:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

					if (prev_OutReady)

					begin

						serial_Output_En = 1'b1;

						outReady = 1'b1;

					end

					if( (|{x_FlagBit,xw_Ptr_Buff_L}) )

					begin

						ALU_En = 1'b1;

					end

				end

				

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else if (prev_OutReady)

				begin

					ALU_En = 1'b0;

				end

				

				else if (word_Sent)

				begin

					serial_Output_En = 1'b0;

					outReady = 1'b0;

				end

				else

				begin

					next_State <= state6;

				end

				

			end

			

			state7:

			begin

				if(reset)

				begin

					next_State <= state5;

				end

			end

			

			state8:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

					if (prev_OutReady)

					begin

						serial_Output_En = 1'b1;

						outReady = 1'b1;

					end

					ALU_En = 1'b1;

				end

				

				else if (!sleep)

				begin

					ALU_En = 1'b0;

				end

				

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				

				else if (word_Sent)

				begin

					serial_Output_En = 1'b0;

					outReady = 1'b0;

				end

				

				else

				begin

					next_State <= state8;

				end

			end

			

			default:

			begin

				frame_Edg <= 1'b0;

				outReady = 1'b0;

				ALU_En = 1'b0;

				serial_Output_En = 1'b0;

			end

		endcase

	end

end