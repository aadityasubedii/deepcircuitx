always@(DATA_IN or i)
begin
	DATA_OUT = DATA_IN  + DELAY[i];
end