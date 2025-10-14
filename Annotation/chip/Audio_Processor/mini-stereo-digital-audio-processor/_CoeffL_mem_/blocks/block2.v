always @(posedge coeff_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			coeffl[row]=0;
		end
	end
	
	if(row<512)
		coeffl[row]=Input;
end