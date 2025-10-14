	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		#50;
		repeat(10) begin
			clockenable=~clockenable;
			#3500;
		end
	end