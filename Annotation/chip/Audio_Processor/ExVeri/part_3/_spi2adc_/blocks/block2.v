	always @(posedge sysclk)
		if(adc_done) 					
				data_from_adc = shift_reg;

	