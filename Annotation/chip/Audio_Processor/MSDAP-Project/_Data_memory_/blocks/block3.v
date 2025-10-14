	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			data_mem[data_wr_addr] = data_in;
		else
			data_mem[data_wr_addr] = data_mem[data_wr_addr];
	end