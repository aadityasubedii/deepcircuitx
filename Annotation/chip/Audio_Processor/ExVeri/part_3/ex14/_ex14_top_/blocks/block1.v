	always @ (posedge TICK_10KHz)
		COUNT <= COUNT + SW;
