  always @(posedge clk)
    if (rst || rdlvl_stg1_rank_done)
      first_rdlvl_pat_r <= #TCQ 1'b1;
    else if (phy_wrdata_en && (init_state_r == INIT_RDLVL_STG1_WRITE))
      first_rdlvl_pat_r <= #TCQ 1'b0;
      