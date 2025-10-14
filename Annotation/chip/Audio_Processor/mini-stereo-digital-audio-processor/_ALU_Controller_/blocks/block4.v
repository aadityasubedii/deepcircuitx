always @(negedge Frame)
begin
	if(il==16)
	begin
		shift_statusL= 0;
		il=0;
		P2S_status=0;
		index_rjL=il;
		pL = 0;
		jL = pL;
		index_coeffL=jL;
		yl=40'b0;
		ul = 40'b0;
		sign_statusL=0;
		flagL=1;
	end
end