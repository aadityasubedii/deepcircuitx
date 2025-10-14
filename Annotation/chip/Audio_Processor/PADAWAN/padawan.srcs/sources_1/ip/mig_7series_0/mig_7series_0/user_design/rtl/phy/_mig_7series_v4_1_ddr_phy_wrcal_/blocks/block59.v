  generate
    if (nCK_PER_CLK == 4) begin: match_data_4
      assign dbg_phy_wrcal[0]    = pat_data_match_r;
    end else begin:match_data_2
      assign dbg_phy_wrcal[0]    = 1'b0;
    end
  endgenerate