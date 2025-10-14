always @ (AnP, TR) begin
	if ( TR == 0) begin
		AnR = AnP;                   
	end else begin
		AnR = 0;                     
	end
end