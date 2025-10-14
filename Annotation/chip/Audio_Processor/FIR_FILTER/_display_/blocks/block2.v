always @(posedge clock)
	if(reset || (streg == st_done)) y <= 0;
	else if(y < ymax) y <= y + 1;
