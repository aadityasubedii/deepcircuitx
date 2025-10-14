		always@(posedge CLK_I_BUFG)
		if (reset)
			begin
			count <= 0;
			initialized <= 0;
			end
		else if (count < 20000) 
			begin
			count <= count + 1;
			initialized <= 0;
			end
		else
			begin
			count <= 20000; 
			initialized <= 1;
			end