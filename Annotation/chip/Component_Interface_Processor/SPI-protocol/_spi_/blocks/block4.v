always @(sclk_ref_i) begin    
	if (sclk_running) begin
		sclk = sclk_ref_i; 
	end
	else begin
		sclk = 1;      
	end
end