  always @(posedge clk)
    if (rst || wrcal_resume ||
       (init_state_r == INIT_WRCAL_ACT_WAIT))
      first_wrcal_pat_r <= #TCQ 1'b1;
    else if (phy_wrdata_en && (init_state_r == INIT_WRCAL_WRITE))
      first_wrcal_pat_r <= #TCQ 1'b0;
