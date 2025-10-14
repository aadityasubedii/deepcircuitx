always@(negedge clock) begin
	if(contador<10) begin
		contador<=contador+1;
		enablegain<=1;
	end
	else if(contador<45) begin
		contador<=contador+1;
		enablegain<=0;
		enableadc<=1;
		enabledac<=0;
	end
	else if(contador<78) begin
		contador<=contador+1;
		enableadc<=0;
		enabledac<=1;
	end
	else if(contador==78) contador<=10;
	
	
end