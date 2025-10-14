	initial begin
		mclk = 1;
		forever begin
			#40;
			mclk = ~mclk;
		end
	end