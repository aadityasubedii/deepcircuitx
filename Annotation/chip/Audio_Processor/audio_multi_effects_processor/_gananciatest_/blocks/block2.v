initial begin
		clock = 0;
		clockenable = 0;
		#100;
		repeat(200) begin
		clock=~clock;
		#50;
		end
	end