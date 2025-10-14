   always @ (posedge CLK_100MHz) begin
     
	if (reset) 
	step <= 16'h0400;
     
	else begin
		if (sup & ~old_sup & step != 16'hFFFF)  
		step <= step + 16'h0F;       
		if (sdown & ~old_sdown & step != 16'h0) 
		step <= step - 16'h0F; 		     
	end
     
	old_sup <= sup;
	old_sdown <= sdown;
   
	end