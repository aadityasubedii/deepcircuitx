always @(negedge Frame)
begin
	if(ir==16)
	begin
		shift_statusR= 0;
		ir=0;
		P2S_status=0;
		index_rjR=ir;
		pR = 0;
		jR = pR;
		index_coeffR=jR;
		yr=40'b0;
		ur = 40'b0;
		sign_statusR=0;
		flagR=1;
	end
end