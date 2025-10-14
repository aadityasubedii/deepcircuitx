always@(posedge clk)
begin
	if(rlrot == 2'b11) 
		begin
			if(i < 25)begin
				i <= i + 1;
			end
			
			else if(i == 25)begin
				i <= 25;
			end
		end
	if(rlrot == 2'b10) 
		begin
			if(i > 0)begin
				i <= i - 1;
			end
			
			else if(i == 0)begin
				i <= 0;
			end
		end
end