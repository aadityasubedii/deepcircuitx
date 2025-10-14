	always @ (posedge Dclk)
	begin
	if(InReady)
	begin
		if( (k==0) && (j<15056) )
		begin
			Frame = 1'b1;
			
		end
		if (k == 1)
		begin
			Frame = 1'b0;
		end
		
		if ( j<15056 )
		begin
			InputL = data[j][k];
			InputR = data[j+1][k];
		end
		

		k = k +1;

		if (k == 16)
		begin
			k = 0;
			count = (j/2)+1;
			
			
			j = j+2;
		end
		if(((j == 9458)|| (j == 13058)) && (k == 0))
		begin
			#100
			Reset = 1'b0;
			#100
			Reset = 1'b1;
			Frame = 1'b0;
			k =0;
		end
	end
	end