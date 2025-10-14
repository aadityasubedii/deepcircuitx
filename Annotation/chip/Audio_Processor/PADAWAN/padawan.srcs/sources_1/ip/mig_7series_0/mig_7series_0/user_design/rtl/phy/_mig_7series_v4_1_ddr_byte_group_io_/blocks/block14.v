always @(posedge phy_clk) begin
  rst_r1 <= #1 rst;
  rst_r2 <= #1 rst_r1;
  rst_r3 <= #1 rst_r2;
  rst_r4 <= #1 rst_r3;
end