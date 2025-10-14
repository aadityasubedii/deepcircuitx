	always @(posedge clk_1MHz)
		if((dac_start==1'b1)&&(dac_cs==1'b1))		
			shift_reg <= {cmd,data_in,2'b00};
		else 													
			shift_reg <= {shift_reg[14:0],1'b0};