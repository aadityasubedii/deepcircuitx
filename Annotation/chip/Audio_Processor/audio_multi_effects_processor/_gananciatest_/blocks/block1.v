	initial begin
		clock = 0;
		clockenable = 0;
		#50;
		repeat(10) begin
		clockenable=~clockenable;
		#1000;
		end
end