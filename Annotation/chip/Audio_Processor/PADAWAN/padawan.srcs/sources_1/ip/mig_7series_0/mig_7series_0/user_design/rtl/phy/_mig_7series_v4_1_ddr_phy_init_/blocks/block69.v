   always @(posedge clk)
     if (rst || (init_state_r == INIT_WRCAL_WRITE_READ) ||
        (wrcal_wr_cnt == 4'd0))
       wrcal_wr_cnt <= #TCQ NUM_STG1_WR_RD;
     else if ((init_state_r == INIT_WRCAL_WRITE) && 
             new_burst_r && ~phy_data_full)
       wrcal_wr_cnt <= #TCQ wrcal_wr_cnt - 1;
