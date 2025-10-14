always @( posedge reset, posedge clk ) begin
	if (reset) begin
		daddress_r <= 'd0;
	end else begin
		if ( !i_mem_stall ) begin
	      	daddress_r              <= i_daddress;
		end
	end
end