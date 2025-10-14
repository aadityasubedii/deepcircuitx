	always @(negedge Sclk)
	begin
		if(Start == 1'b1)
		begin
			PISO_count_R = 6'd40;
			piso_reg_R = 40'd0;
			out_rdy_R = 1'b0;
			frame_flag_R = 1'b0;
			OutReady_R = 1'b0;
			OutputR = 1'b0;
		end
		else if (out_flag_R == 1'b1)
		begin
			piso_reg_R = out_temp_R;
			frame_flag_R = 1'b0;
			OutReady_R = 1'b0;
			OutputR = 1'b0;
			out_rdy_R = 1'b1;
		end
		else if (Frame == 1'b1 && out_rdy_R == 1'b1 && frame_flag_R == 1'b0)
		begin
			PISO_count_R = PISO_count_R - 1'b1;
			OutputR = piso_reg_R [PISO_count_R];
			frame_flag_R = 1'b1;
			out_rdy_R = 1'b0;
			OutReady_R = 1'b1;
		end
		else if (frame_flag_R == 1'b1)
		begin
			PISO_count_R = PISO_count_R - 1'b1;
			OutputR = piso_reg_R [PISO_count_R];
			OutReady_R = 1'b1;
			if (PISO_count_R == 6'd0)
				frame_flag_R = 1'b0;
		end
		else
		begin
			PISO_count_R = 6'd40;
			
			
			
			OutputR = 1'b0;
			OutReady_R = 1'b0;
		end
	end