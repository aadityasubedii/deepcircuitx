always @(posedge Sclk)
begin
	
	if (col==-1)
	begin
		col_out = col;
		OutReady=0;
		col=39;
	end
	if(col<=38 && col>-1)
	begin
		col_out=col;
		OutputL=OutputdataL[col];
		OutputR=OutputdataR[col];
		col=col-1;
		col_out=col;
		if(col==-1)
			col_out=-1;
	end
end