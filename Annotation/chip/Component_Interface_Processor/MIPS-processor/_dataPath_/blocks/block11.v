always @(dataIn)
begin

	if(dataIn[7]==1'b1)   
	begin
	
		for(count=0;count<16;count=count+1)
		begin
			if(count<8)
			begin
				tempA[count] = dataIn[count];
			end
			
			else
			tempA[count] = 1;
		end
	
	
	end
	
	else if(dataIn[7]==1'b0)     
	begin
	
	for(count=0;count<16;count=count+1)
		begin
			if(count<8)
			begin
			tempA[count] = dataIn[count];
			end
			
			else
			tempA[count] = 0;
		end
		
	end	
end