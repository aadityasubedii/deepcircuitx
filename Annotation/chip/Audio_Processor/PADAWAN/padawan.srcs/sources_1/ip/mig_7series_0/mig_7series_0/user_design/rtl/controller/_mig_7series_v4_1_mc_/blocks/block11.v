  generate

    if (ECC == "OFF") begin : ecc_off
    
      assign rd_data = phy_rd_data;
      assign mc_wrdata = wr_data;
      assign mc_wrdata_mask = wr_data_mask;
      assign ecc_single = 4'b0;
      assign ecc_multiple = 4'b0;
    
    end