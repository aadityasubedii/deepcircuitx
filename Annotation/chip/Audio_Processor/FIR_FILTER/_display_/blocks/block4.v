always @(posedge clock)
	if(reset) streg <= st_done;
	else streg <= st;