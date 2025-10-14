       else if (!complex_oclkdelay_calib_done && ~phy_data_full) 
          phy_wrdata <= #TCQ prbs_o;
  end else begin: wrdq_div1_2to1_wrcal_first