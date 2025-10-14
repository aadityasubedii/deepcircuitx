   always @(posedge clk)
     if (rst || (init_state_r == INIT_OCLKDELAY_WRITE_WAIT) ||
        (oclk_wr_cnt == 4'd0))
       oclk_wr_cnt <= #TCQ NUM_STG1_WR_RD;
     else if ((init_state_r == INIT_OCLKDELAY_WRITE) && 
             new_burst_r && ~phy_data_full)
       oclk_wr_cnt <= #TCQ oclk_wr_cnt - 1;