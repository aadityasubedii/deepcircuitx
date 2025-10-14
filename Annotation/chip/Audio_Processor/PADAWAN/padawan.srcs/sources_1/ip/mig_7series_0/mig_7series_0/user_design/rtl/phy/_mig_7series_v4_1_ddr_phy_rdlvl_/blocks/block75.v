  always @(posedge clk)
    if (rst)
      rdlvl_prech_req <= #TCQ 1'b0;
    else
      rdlvl_prech_req <= #TCQ cal1_prech_req_r;