	always @ (posedge clock) 
		begin
		if (enable==1'b1)
			sreg<= {sreg[6:1], sreg[7] ^ sreg[1]};
		end 