always@ (DQnMAG, Un) begin
	if (DQnMAG == 16'h0000) begin
		UGBn <= 16'h0000;		
	end else if (Un) begin
		UGBn <= 16'hFF80;		
	end else begin
		UGBn <= 16'h0080;		
	end
end