	always @(posedge Sclk)
	begin
		if(write_enable == 1'b1)
			coeffmem[coeffwrite] = in_data;
		else
			coeffmem[coeffwrite] = coeffmem[coeffwrite];		
	end