  generate
    if (nCK_PER_CLK == 4) begin: mux_data_4
      assign dbg_phy_wrcal[56+:8]     = mux_rd_rise2_r;
      assign dbg_phy_wrcal[64+:8]     = mux_rd_fall2_r;
      assign dbg_phy_wrcal[72+:8]     = mux_rd_rise3_r;
      assign dbg_phy_wrcal[80+:8]     = mux_rd_fall3_r;
    end else begin: mux_data_2
      assign dbg_phy_wrcal[56+:8] = {8{1'b0}};
      assign dbg_phy_wrcal[64+:8] = {8{1'b0}};
      assign dbg_phy_wrcal[72+:8] = {8{1'b0}};
      assign dbg_phy_wrcal[80+:8] = {8{1'b0}};
    end
  endgenerate