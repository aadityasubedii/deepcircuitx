  always @(posedge clock) begin
    if(ready) begin
	    sample[offset] <= x;	
		 
index  <= 0;		
       accum  <= 0;
       done   <= 0;		 
	 end
	 
    if (!ready && (index < 30) ) begin   
	    accum <= accum + coeff * sample[offset-index];
	    index <= index + 5'h1;
    end		
    if (!done && (index == 30) ) begin   
		 output_reg <= accum;   
		 done <= 1'b1;           
    end	

  end