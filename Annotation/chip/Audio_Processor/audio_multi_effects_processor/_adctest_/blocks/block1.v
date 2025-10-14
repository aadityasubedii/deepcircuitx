	initial begin
		clock = 0;
		clockenable = 0;
		miso = 0;
		repeat(700) begin
			miso=~miso;
			#100;
		end
end