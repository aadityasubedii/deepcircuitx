   always
	begin
		#(Dclk_period/2) Dclk = ~Dclk;
	end  