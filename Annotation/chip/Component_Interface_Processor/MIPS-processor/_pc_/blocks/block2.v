always @(posedge clock)
begin
	temp=$signed(temp)+$signed(inaddr);   
end