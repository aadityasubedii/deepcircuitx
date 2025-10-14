	always @ (posedge clk)
	begin
		sreg <= {sreg[6:1], sreg[1] ^ sreg[7]};
	end