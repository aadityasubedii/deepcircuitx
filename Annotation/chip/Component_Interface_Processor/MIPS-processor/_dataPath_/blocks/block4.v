	always @(s0,i0,i1)
	begin	
	
	if (s0==1'b0)
		tempout = i0;
	else
		tempout = i1;	
	end	