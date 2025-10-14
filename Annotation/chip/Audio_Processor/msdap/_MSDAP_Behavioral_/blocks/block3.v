	always @(negedge Sclk)
	begin
		if(Start == 1'b1)
		begin
			PISO_count_L = 6'd40;
			piso_reg_L = 40'd0;
			out_rdy_L = 1'b0;
			frame_flag_L = 1'b0;
			OutReady_L = 1'b0;
			OutputL = 1'b0;
		end
		else if (out_flag_L == 1'b1)
		begin
			piso_reg_L = out_temp_L;
			frame_flag_L = 1'b0;
			OutReady_L = 1'b0;
			OutputL = 1'b0;
			out_rdy_L = 1'b1;
		end
		else if (Frame == 1'b1 && out_rdy_L == 1'b1 && frame_flag_L == 1'b0)
		begin
			PISO_count_L = PISO_count_L - 1'b1;
			OutputL = piso_reg_L [PISO_count_L];
			frame_flag_L = 1'b1;
			out_rdy_L = 1'b0;
			OutReady_L = 1'b1;
		end
		else if (frame_flag_L == 1'b1)
		begin
			PISO_count_L = PISO_count_L - 1'b1;
			OutputL = piso_reg_L [PISO_count_L];
			OutReady_L = 1'b1;
			if (PISO_count_L == 6'd0)
				frame_flag_L = 1'b0;
		end
		else
		begin
			PISO_count_L = 6'd40;
			
			
			
			OutputL = 1'b0;
			OutReady_L = 1'b0;
		end
	end