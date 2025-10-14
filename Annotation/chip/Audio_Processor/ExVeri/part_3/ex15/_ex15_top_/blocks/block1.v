	always @ (posedge TICK_10KHz)
		COUNT <= COUNT + a2d_data;