always @(posedge Dclk)
begin
	if(Reset_n==1'b1)
	begin
	if(InReady	== 1)
	begin
		
		if(ib<15056)
		begin
			if(jb==15)
			begin
				Frame = 1'b1;
			end
			if(jb>-1)
			begin
				InputL = input_data[ib][jb]; 
				InputR = input_data[ib+1][jb];#1302;
				Frame = 1'b0;
				jb = jb-1;
			end
			if(jb==-1)
			begin
				ib=ib+2;
				jb=15;
			end
		end
	end
	end
end