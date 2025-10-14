always @(posedge in_status)
begin

	if(Reset_n==0 || clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			inr[row]=0;
		end
	end
	
	if(row<512)
		inr[row]=Input;
end