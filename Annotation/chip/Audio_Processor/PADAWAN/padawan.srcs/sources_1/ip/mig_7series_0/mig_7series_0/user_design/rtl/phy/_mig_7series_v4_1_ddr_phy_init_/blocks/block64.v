  always @(posedge clk)
    if (rst ||(init_state_r == INIT_WRCAL_READ_WAIT))
      wrcal_reads <= #TCQ 2'b00;
    else if ((wrcal_reads > 2'b00) && ~(phy_ctl_full || phy_cmd_full))
      wrcal_reads <= #TCQ wrcal_reads - 1;
    else if ((init_state_r == INIT_WRCAL_MULT_READS) || phy_ctl_full || 
             phy_cmd_full && new_burst_r)
      wrcal_reads <= #TCQ 'd255;