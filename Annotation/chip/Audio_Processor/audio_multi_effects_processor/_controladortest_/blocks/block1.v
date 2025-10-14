	initial begin
		clock = 0;
		#100;
		repeat(300) begin
			clock=~clock;
			#50;
		end
end