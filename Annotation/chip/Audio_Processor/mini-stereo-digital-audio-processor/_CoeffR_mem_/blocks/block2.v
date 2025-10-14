always @(posedge coeff_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			coeffr[row]=0;
		end
	end
	
	if(row<512)
		coeffr[row]=Input;
end