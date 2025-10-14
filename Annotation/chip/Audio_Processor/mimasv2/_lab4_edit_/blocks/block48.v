   always @ (posedge CLK_100MHz) begin
     if (reset) filtnum <= 4'd0;
     else begin
	if (fup & ~old_fup & filtnum != 4'd15) filtnum <= filtnum+4'h1;       
	if (fdown & ~old_fdown & filtnum != 4'd0) filtnum <= filtnum-4'h1;       
     end
     old_fup <= fup;
     old_fdown <= fdown;
   end