	always @(negedge sysclk)
		if((adc_cs==1'b0)&&(shift_ena==1'b1)&&(tick==1'b1))		
				shift_reg <= {shift_reg[8:0],sdata_from_adc};
	