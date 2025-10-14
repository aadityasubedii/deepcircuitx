always @(posedge Sclk)
begin
	if(OutReady==1'b1)
	begin
	if (l==40)
	begin
		if(Frame==1'b1)
			k=k+1;
	end
	if(k<7000 && k>=0)
	begin
		if(l>-1)
		begin
			l=l-1;
			data_outl[k][l]= OutputL;
			data_outr[k][l]= OutputR;	
			if(l==0)
			begin
				$fwrite(data_out,"   %h      %h\n",data_outl[k],data_outr[k]);
				
				l=40;
			end
		end
	end
	if(k==7000)
	begin
		$fclose(data_out);
		
	end
	end
end