  always @(posedge clk)
    if(rst)
      ofs_rdy_r <= #TCQ 1'b0;
    else
      ofs_rdy_r <= #TCQ ~phy_mc_cmd_full_r && ~phy_mc_ctl_full_r && ~(phy_mc_data_full && ~rd_wr_r);