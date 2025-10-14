    always @(posedge clk)
      if ((~oclkdelay_calib_done) && (DRAM_TYPE == "DDR3"))
        phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}}};
      else if ((!wrcal_done)&& (DRAM_TYPE == "DDR3")) begin
        if (extend_cal_pat)
          phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h6}},{DQ_WIDTH/4{4'h9}},
                              {DQ_WIDTH/4{4'hA}},{DQ_WIDTH/4{4'h5}},
                              {DQ_WIDTH/4{4'h5}},{DQ_WIDTH/4{4'hA}},
                              {DQ_WIDTH/4{4'h0}},{DQ_WIDTH/4{4'hF}}};
        else if (first_wrcal_pat_r)
          phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h6}},{DQ_WIDTH/4{4'h9}},
                              {DQ_WIDTH/4{4'hA}},{DQ_WIDTH/4{4'h5}},
                              {DQ_WIDTH/4{4'h5}},{DQ_WIDTH/4{4'hA}},
                              {DQ_WIDTH/4{4'h0}},{DQ_WIDTH/4{4'hF}}};