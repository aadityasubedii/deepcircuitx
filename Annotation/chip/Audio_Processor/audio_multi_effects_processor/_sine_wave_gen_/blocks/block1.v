always@(posedge clk)
begin
	data_out=sine[i];
	i=i+1;
	if(i==29)
		i=0;
end