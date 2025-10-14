  always @(posedge clk) begin
    rd_active_r         <= #TCQ phy_rddata_en;
    rd_active_r1        <= #TCQ rd_active_r;
    rd_active_r2        <= #TCQ rd_active_r1;
    rd_active_r3        <= #TCQ rd_active_r2;
    rd_active_r4        <= #TCQ rd_active_r3;
    rd_active_r5        <= #TCQ rd_active_r4;
  end