always @ (posedge bclk) 
begin
	if (reset || clear)
	begin
		bit_index = DATA_WIDTH;
		reg_adc_left = is_left_ch;
		adcfifo_write = 1'b0;
		valid_bit = 0;
	end
	else
	begin
		if (adcfifo_write)
			adcfifo_write = 1'b0;  

		if (reg_adc_left ^ is_left_ch)
		begin		
			reg_adc_left = is_left_ch;
			valid_bit = 1'b1;
			wait_one_clk = 1'b1;
			if (reg_adc_left)
				bit_index = DATA_WIDTH;
		end

		
		if (valid_bit && wait_one_clk)  
				wait_one_clk = 1'b0;
		else if (valid_bit && !wait_one_clk)  		
		begin
			bit_index = bit_index - 1'b1;
			reg_adc_serial_data[bit_index] = adcdat;
			if ((bit_index == 0) || (bit_index == (DATA_WIDTH/2)))
			begin	
				if (bit_index == 0 && !adcfifo_full)
				begin  
					adcfifo_writedata = reg_adc_serial_data;
					adcfifo_write = 1'b1;  
				end
				valid_bit = 0;
			end
		end			
	end
end