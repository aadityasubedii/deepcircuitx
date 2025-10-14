	always @ (posedge clock)
		if (reset == 1'b1)
			count <= 1'b0;
		else if(enable == 1'b1)
			count <= count + 1'b1;