  always @(posedge clk or posedge rst) begin
    if (rst)
      phy_reset_n <= #TCQ 1'b0;
    else
      phy_reset_n <= #TCQ cnt_pwron_reset_done_r;

  end