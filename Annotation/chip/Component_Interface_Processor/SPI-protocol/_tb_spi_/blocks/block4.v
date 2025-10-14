initial begin
	pclk_i = 0;
	forever #5 pclk_i =  ~pclk_i;
end