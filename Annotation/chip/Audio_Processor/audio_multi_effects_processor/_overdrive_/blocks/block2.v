always@(posedge clk)
begin
	if(rlrot == 2'b11) 
		begin
			if(THRES < 1500)begin
				THRES <= THRES + 100;
			end
			
			else if(THRES == 1500)begin
				THRES <= 1500;
			end
		end
	else if(rlrot == 2'b10) 
		begin
			if(THRES > 100)begin
				THRES <= THRES - 100;
			end
			
			else if(THRES == 100)begin
				THRES <= 100;
			end
		end
end