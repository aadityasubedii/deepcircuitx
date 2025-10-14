      always @(*) begin
        if (~phy_data_full && ((init_state_r == INIT_RDLVL_STG1_WRITE) ||
            (init_state_r == INIT_OCLKDELAY_WRITE) ||
            (init_state_r == INIT_OCAL_CENTER_WRITE) || 
            (init_state_r == INIT_WRCAL_WRITE)))
          phy_wrdata_en = 1'b1;
        else
          phy_wrdata_en = 1'b0;
      end