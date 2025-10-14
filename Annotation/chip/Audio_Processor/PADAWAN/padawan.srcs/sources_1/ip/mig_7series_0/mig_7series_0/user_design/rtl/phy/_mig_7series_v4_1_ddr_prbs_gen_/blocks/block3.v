    always @(posedge clk_i)
      if (rst_i)
        sel   <= #TCQ 'd0;
      else begin  
	    for (i = 0; i < DQ_WIDTH/8; i = i+1) begin
	      for (j=0; j <8 ; j = j+1) begin
	        if (j == victim_sel)
		      sel[i*8+j] <= #TCQ 1'b1;
		    else 
		      sel[i*8+j] <= #TCQ 1'b0;
		    end   	
	     end
      end
  end