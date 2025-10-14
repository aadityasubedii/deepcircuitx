	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			coeff_mem[coeff_wr_addr] = data_in;
	end