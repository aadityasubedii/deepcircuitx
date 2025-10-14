always @(posedge Sclk)
begin
	if(sign_statusL==1)
	begin
		if(signinL[15]==1)
		begin
			padL=40'hFF00000000;
			padL[31:16]=signinL;
		end
		else
		begin
			padL=40'h0000000000;
			padL[31:16]=signinL;		
		end
	end
	
	signoutL=padL;
end