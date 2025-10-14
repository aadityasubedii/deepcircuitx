	always @ (posedge sysclk) 
	begin
		if(full == 1'b1 && wrreq == 1'b1)
			rdreq_dff <= 1'b1;
		else
			rdreq_dff <= 1'b0;
	end