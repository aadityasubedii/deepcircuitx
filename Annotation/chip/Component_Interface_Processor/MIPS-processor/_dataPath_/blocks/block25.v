always @(posedge clock,clear)     
begin

	if(clear==1'b0)    
	begin

		for(count=0;count<16;count=count+1)
		begin
			registers[count] = 0;
		end

	end
	
	tempA=registers[Aadd];
	tempB=registers[Badd];
	
	if(load==1'b1)   
	begin
	registers[Cadd]=Cin;
	end	
end