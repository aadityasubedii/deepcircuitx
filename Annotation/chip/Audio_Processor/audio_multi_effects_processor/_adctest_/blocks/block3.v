	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		#100;
		repeat(700) begin
			clock=~clock;
			#50;
		end
	end