	always @(negedge Dclk, Reset_n, Start)
	begin
		if ((Reset_n == 0) || (Start == 1'b1))
		begin
			bit_count = 5'd16;
			input_rdy_flag = 1'b0;
		end
		else
		begin
			if (Frame == 1'b1)
			begin
				bit_count = 5'd15;
				input_rdy_flag = 1'b0;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
			end
			else
			begin
				bit_count = bit_count - 1'b1;
				data_L [bit_count] = InputL;
				data_R [bit_count] = InputR;
				if (bit_count == 5'd0)
				begin
					input_rdy_flag = 1'b1;
				end
			end
		end
	end