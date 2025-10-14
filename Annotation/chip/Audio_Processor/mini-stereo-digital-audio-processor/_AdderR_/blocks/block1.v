always @(addip1R or addip2R or addorsubR)
begin
	if(addorsubR == 1'b1)
		addopR=addip1R-addip2R;
	else
		addopR=addip1R+addip2R;
end