  always @(posedge clk)
    if ((init_state_r == INIT_IDLE) ||
        (init_state_r == INIT_RDLVL_STG1_WRITE))
      cnt_init_data_r <= #TCQ 2'b00;
    else if (phy_wrdata_en)
      cnt_init_data_r <= #TCQ cnt_init_data_r + 1;
    else if (init_state_r == INIT_WRCAL_WRITE)
      cnt_init_data_r <= #TCQ 2'b10;     