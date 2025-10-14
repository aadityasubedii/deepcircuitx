  always @(posedge clk) 
    if (rst) begin
      my_empty <=  #TCQ 5'b11111;
      my_full  <=  #TCQ 2'b00;
      rd_ptr   <=  #TCQ 'b0;
      rd_ptr_timing   <=  #TCQ 'b0;
      wr_ptr   <=  #TCQ 'b0;
    end else begin
      
      
      
      
      if (my_empty[1] && !my_full[1] && rd_en_in && !empty_in[1]) ;
      else
        
        
        
        
        updt_ptrs(rd_en_in, !empty_in[1]);
    end