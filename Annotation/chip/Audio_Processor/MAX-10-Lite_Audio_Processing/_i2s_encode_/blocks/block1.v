always @(negedge SCLK)
	begin
		
	count <= count + 1;

	if (LR != LRCK)
		begin
		count <= 0;
		LR <= LRCK;
		if (LRCK == 0)
			data_buf <= data_in_L;
		else
			data_buf <= data_in_R;
		end
	else if (count < RESOLUTION)
		data_out <= data_buf[RESOLUTION-1-count];
	
	end