	always @(posedge Sclk)
	begin
		if(Clear == 1'b1)
		begin
			count_bit = 6'd40;
			register_piso = 40'd0;
			ready_out = 1'b0;
			frame_flag = 1'b0;
			OutReady = 1'b0;
			SerialOut = 1'b0;
		end
		else if (p2s_en == 1'b1)
		begin
			register_piso = Shift_done;
			ready_out = 1'b1;
		end
		else if (Frame == 1'b1 && ready_out == 1'b1 && frame_flag == 1'b0)
		begin
			count_bit = count_bit - 1'b1;
			SerialOut = register_piso [count_bit];
			frame_flag = 1'b1;
			ready_out = 1'b0;
			OutReady = 1'b1;
		end
		else if (frame_flag == 1'b1)
		begin
			count_bit = count_bit - 1'b1;
			SerialOut = register_piso [count_bit];
			OutReady = 1'b1;
			if (count_bit == 6'd0)
				frame_flag = 1'b0;
		end
		else
		begin
			count_bit = 6'd40;
			SerialOut = 1'b0;
			OutReady = 1'b0;
		end
	end