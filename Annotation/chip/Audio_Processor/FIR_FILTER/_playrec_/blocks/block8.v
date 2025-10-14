always @(posedge CLOCK_50)
	if(reset) streg <= st_input_check;
	else streg <= st;
