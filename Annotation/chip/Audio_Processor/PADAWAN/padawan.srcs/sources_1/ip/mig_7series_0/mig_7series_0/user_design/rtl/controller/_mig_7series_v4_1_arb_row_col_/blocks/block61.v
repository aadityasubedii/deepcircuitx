  generate
  
    if((nCK_PER_CLK == 4) && (ADDR_CMD_MODE != "2T")) begin : pre_4_1_1T_arb
    
      reg granted_pre_r;
      wire[nBANK_MACHS-1:0] grant_pre_r_lcl;

      wire granted_pre_ns = |rts_pre;
      assign grant_pre_r = grant_pre_r_lcl;