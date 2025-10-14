	always @ ( posedge clk or  posedge reset)
		if (reset == 1'b1) prev_reset <= 1'b0;
		else  prev_reset <= w_reset;