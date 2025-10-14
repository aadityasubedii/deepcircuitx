	always @ (posedge clock) 
		begin
		if (enable==1'b1)
			sreg<= {sreg[14:1], sreg[14] ^ sreg[10] ^ sreg[6] ^ sreg[1]};
		end