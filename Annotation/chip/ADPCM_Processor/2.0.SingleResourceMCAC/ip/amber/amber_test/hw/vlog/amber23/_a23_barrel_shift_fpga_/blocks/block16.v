	for (i = 1; i < 5; i = i + 1)
	begin : router
		assign netgen[i-1].in = netgen[i].out;
	end