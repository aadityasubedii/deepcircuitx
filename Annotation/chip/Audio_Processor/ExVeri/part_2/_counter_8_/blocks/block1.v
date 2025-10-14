always @ (posedge clock)
	if (enable == 1'b1)
		count <= count + 1'b1;