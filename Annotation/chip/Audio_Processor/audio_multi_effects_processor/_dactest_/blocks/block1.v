	initial begin
		clock = 0;
		clockenable = 0;
		datos = 2357;
		#50;
		repeat(5) begin
			clockenable=~clockenable;
			#3400;
		end
end