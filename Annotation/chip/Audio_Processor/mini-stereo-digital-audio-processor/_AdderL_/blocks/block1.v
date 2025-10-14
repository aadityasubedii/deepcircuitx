always @(addip1L or addip2L or addorsubL)
begin
	if(addorsubL == 1'b1)
		addopL=addip1L-addip2L;
	else
		addopL=addip1L+addip2L;
end