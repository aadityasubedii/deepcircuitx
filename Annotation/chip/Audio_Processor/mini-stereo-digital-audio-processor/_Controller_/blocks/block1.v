always @(Sclk)
begin
	if(Reset_n==1'b0)
	begin
		InReady=1'b0;
		state=7;
		alu_status=0;
	end
end