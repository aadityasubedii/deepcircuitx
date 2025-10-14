always @(posedge SCLK)
	begin
		
	count <= count + 1;

	if (LR != LRCK)
		begin
		count <= 0;
		LR <= LRCK;
		data_out_L <= data_L;
		data_out_R <= data_R;
		end
	
	else if (count < RESOLUTION) begin
		if (LRCK == 0)
			data_L[RESOLUTION-1-count] <= data_in;
		else
			data_R[RESOLUTION-1-count] <= data_in;
		end
	
	end