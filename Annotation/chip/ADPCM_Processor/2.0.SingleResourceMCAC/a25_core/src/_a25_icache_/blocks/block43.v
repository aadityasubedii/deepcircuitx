always @ ( posedge reset, posedge clk ) begin
	if (reset) begin
		address_r <= 'd0;
	end else begin
		address_r <= address_c;
	end
end