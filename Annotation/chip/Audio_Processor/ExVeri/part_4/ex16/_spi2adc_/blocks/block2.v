	always @(posedge clk_1MHz)
		if(adc_done) 					
				data_from_adc = shift_reg;

	