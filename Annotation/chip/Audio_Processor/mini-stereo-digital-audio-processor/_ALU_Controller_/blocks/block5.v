always @(posedge Sclk)
begin
	if(Reset_n==1'b0)
	begin
		
		
		yl=40'b0;
		yr=40'b0;
		ur=40'b0;
		ul=40'b0;
		
		flagL=1;
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
		
		flagR=1;
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
		
	end
end