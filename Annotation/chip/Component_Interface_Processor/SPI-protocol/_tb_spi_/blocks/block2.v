initial begin
	prst_i = 1;
	paddr_i = 0;
	pwdata_i = 0;
	pwrite_i = 0;
	penable_i = 0;
	miso = 1;
	repeat(2) @(posedge pclk_i);
	prst_i  = 0;
	
	for (i = 0; i < MAX_TXS; i=i+1) begin
		reg_write(i, 8'hD3+i);    
	end
	
	for (i = 0; i < MAX_TXS; i=i+1) begin
		reg_write(8'h10+i, 8'h46+i);   
	end
	
	reg_write(8'h20, {3'h2, 1'b1});   
	#300;
	reg_write(8'h20, {3'h3, 1'b1});   
	#300;
	reg_write(8'h20, {3'h0, 1'b1});    
	#1000;
	$finish;
end