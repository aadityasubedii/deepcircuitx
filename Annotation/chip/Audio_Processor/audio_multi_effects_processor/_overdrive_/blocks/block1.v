always@(DATA_IN or THRES)
begin
	if(DATA_IN > THRES)
		DATA_OUT <= DATA_OUT;
	else
		DATA_OUT <= DATA_IN;
end