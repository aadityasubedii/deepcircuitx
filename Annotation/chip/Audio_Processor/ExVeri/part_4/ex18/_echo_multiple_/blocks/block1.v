	always @ (posedge sysclk)
		data_out <=  y + DAC_OFFSET;
