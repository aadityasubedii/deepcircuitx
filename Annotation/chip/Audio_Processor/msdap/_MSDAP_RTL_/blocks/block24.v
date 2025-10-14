	always @(negedge Sclk)
	begin
		if(wr_en == 1'b1)
			rj_mem[rj_wr_addr] = data_in;
		else
			rj_mem[rj_wr_addr] = rj_mem[rj_wr_addr];		
	end