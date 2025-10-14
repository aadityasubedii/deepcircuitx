always @(posedge CoPrclk_int or posedge reset) begin
	if(reset) begin
		req2		<=	1'b0;
		req1		<=	1'b0;
	end
	else begin
		req2		<=	req1;	
		req1		<=	req;
	end
end