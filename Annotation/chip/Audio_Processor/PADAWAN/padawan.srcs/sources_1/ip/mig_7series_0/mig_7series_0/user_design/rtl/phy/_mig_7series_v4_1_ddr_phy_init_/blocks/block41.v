      end else if (!rdlvl_stg1_done && ~phy_data_full) begin
        
        
        
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