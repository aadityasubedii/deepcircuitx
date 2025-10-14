  always @(posedge clk)
    if(rst) begin
      phy_mc_ctl_full_r <= #TCQ 1'b0;
      phy_mc_cmd_full_r <= #TCQ 1'b0;
    end else begin
      phy_mc_ctl_full_r <= #TCQ phy_mc_ctl_full;
      phy_mc_cmd_full_r <= #TCQ phy_mc_cmd_full;
    end