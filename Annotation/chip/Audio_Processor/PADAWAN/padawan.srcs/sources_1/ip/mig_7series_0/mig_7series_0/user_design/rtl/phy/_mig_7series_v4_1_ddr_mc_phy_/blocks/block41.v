    always @(posedge phy_clk) begin
          phy_wd_reg   <= #1 phy_ctl_wd;
          aux_in1_reg  <= #1 aux_in_1;
          aux_in2_reg  <= #1 aux_in_2;
          sfifo_ready  <= #1 phy_ctl_wr;
    end