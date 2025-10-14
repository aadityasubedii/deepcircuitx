  always @(posedge clock) begin
    if(ready) begin	
		 
		 index  <= 0;		
       accum  <= 10'sh1FF * x;   
       done   <= 0;		 
	 end

    if (!ready && (index < size) ) begin   
	    accum <= accum + revamp * sample[offset - delay];
	    index <= index + 4'd1;
    end		
    if (!done && (index == size) ) begin         

       if(filtnum == 6 ) begin
				sample[offset] <=   x;               
       end
		 
       else begin	    
			   sample[offset] <=   accum[17:10];     
	    end

       output_reg     <=  accum;
       done <= 1;           
    end	

  end