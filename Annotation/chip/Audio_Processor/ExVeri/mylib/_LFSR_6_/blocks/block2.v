	always @ (posedge clk)
	begin
		if(en == 1'b1)
			sreg <= {sreg[5:1], sreg[1] ^ sreg[6]};
	end