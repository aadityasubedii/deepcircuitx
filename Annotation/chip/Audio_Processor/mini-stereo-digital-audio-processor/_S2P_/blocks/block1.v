always @(negedge Dclk or Reset_n)
begin
	if(Frame==1'b1)
		col=15;
		
	if(col>=0)
	begin
		S2P_status=0;
		S2Pdata_L[col]=InputL;
		S2Pdata_R[col]=InputR;
		col=col-1;
	end
	
	if(col==31)
	begin
		S2P_status=1;
		S2P_L=S2Pdata_L;
		S2P_R=S2Pdata_R;
	end
	
end