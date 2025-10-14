always @(posedge rj_status)
begin
	if(clear==1)
	begin
		for(r=0;r<512;r=r+1)
		begin
			rjl[row]=0;
		end
	end
	
	if(row<16)
		rjl[row]=Input;
end