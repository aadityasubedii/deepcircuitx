    always @(posedge clk) begin
      if (rst)
        calib_tap_req  <= #TCQ 1'b0;
      else if (phy_ctl_ready)
        calib_tap_req <= #TCQ 1'b1;
    end