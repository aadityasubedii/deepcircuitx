always @(posedge CLOCK_50)
	if(reset) ain <= 0;
	else if(cnt_in == 16) ain <= sr_in;
