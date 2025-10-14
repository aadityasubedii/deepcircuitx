	always@(posedge clock)
		if(clear)
			ticks <= 0;
		else if (ticks > 800000) 
			ticks <= 0;
		else
			ticks <= ticks + 1;
