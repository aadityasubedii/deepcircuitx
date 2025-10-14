   always @ (posedge clk_i)
       data_valid_r <= #TCQ data_valid_i;
  
  