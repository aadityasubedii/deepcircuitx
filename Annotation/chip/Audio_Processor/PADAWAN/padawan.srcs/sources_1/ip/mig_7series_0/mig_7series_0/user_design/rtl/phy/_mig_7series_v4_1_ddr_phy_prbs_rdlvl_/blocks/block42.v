  always @(posedge clk)
    if (rst)
      prbs_rdlvl_prech_req <= #TCQ 1'b0;
    else
      prbs_rdlvl_prech_req <= #TCQ prbs_prech_req_r;