always @(posedge Frame)
begin
	if(col==39 && P2S_status==1)
	begin
		OutReady=1;
		OutputL=OutputdataL[col];
		OutputR=OutputdataR[col];
		col=col-1;
		col_out=col;
	end
end