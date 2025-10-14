  always @(posedge clk)
    if (rdlvl_wr_rd) begin
      
      
      if (nCK_PER_CLK == 2) begin
        if (!phy_ctl_full)
          new_burst_r <= #TCQ ~new_burst_r;
      end else
        new_burst_r <= #TCQ 1'b1;
    end else
      new_burst_r <= #TCQ 1'b1;
  