	always @(posedge Sclk)
	begin
		if(write_enable == 1'b1)
			rjmem[rjwrite] = in_data;
		else
			rjmem[rjwrite] = rjmem[rjwrite];		
	end