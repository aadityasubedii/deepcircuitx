  always @(posedge clk)
    if (rst)
      wrcal_prech_req <= #TCQ 1'b0;
    else
      
      wrcal_prech_req <= #TCQ cal2_prech_req_r;