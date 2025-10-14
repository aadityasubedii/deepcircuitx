always @(posedge CLOCK_50)
	if(reset) ai <= 0;
	else ai <= {ai[0], (cnt_in == 16)};