always@ (Bn, BnS, rate_in) begin
	if (rate_in == 2'b00) begin
		if (BnS) begin
			ULBn <= 17'h10000 - ({9'h1FF, Bn[15:9]});
		end else begin
			ULBn <= 17'h10000 - ({9'h000, Bn[15:9]});
		end
	end else begin
		if (BnS) begin
			ULBn <= 17'h10000 - ({8'hFF, Bn[15:8]});
		end else begin
			ULBn <= 17'h10000 - ({8'h00, Bn[15:8]});
		end
	end
end