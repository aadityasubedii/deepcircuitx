  always @(posedge clock) begin   
     if (ready) begin
        offset <= offset + 12'h1;  
        if (filtnum == 6) begin    
           size   <= 8'd1;
           revamp <= 10'sh1FF;
        end		 

		  else if (filtnum == 7) begin  
		     size   <= 8'd1;
			  revamp <= 10'sh1FF;
		  
		  end
 
		  else begin
		     size <= 8'd4;
			  revamp <= 10'sh0DF;
		  end

     end
end