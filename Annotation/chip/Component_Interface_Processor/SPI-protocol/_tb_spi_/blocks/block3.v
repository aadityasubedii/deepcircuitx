initial begin
	sclk_ref_i = 0;
	forever #1 sclk_ref_i =  ~sclk_ref_i;
end