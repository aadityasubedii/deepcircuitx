   always @(posedge clock) begin
	   if(ready) 
		   prod <= x * y  ;			
	end