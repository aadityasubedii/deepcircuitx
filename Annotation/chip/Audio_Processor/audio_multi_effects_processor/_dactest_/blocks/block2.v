	initial begin
		clock = 0;
		clockenable = 0;
		datos = 2357;
		#100;
		repeat(340) begin
			clock=~clock;
			#50;
		end
	end