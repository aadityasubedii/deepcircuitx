    always @(posedge clk)
      if (~oclkdelay_calib_done)
        phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'hF}},{DQ_WIDTH/4{4'h0}}};
      else if (!rdlvl_stg1_done && ~phy_data_full)
        
        
        
        if (first_rdlvl_pat_r)
          phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h4}},{DQ_WIDTH/4{4'h2}},
                              {DQ_WIDTH/4{4'h9}},{DQ_WIDTH/4{4'hC}},
                              {DQ_WIDTH/4{4'hE}},{DQ_WIDTH/4{4'h7}},
                              {DQ_WIDTH/4{4'h3}},{DQ_WIDTH/4{4'h9}}};
        else
          
          
          
          phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h4}},{DQ_WIDTH/4{4'h2}},
                              {DQ_WIDTH/4{4'h9}},{DQ_WIDTH/4{4'hC}},
                              {DQ_WIDTH/4{4'hE}},{DQ_WIDTH/4{4'h7}},
                              {DQ_WIDTH/4{4'h1}},{DQ_WIDTH/4{4'hB}}};
      else if (~(prbs_rdlvl_done || prbs_last_byte_done_r) && ~phy_data_full)
          phy_wrdata <= #TCQ prbs_o;