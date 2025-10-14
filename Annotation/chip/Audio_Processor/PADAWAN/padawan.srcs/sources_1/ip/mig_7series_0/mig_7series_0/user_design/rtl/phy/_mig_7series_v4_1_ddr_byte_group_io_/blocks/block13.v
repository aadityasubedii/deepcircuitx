always @(posedge phy_clk) begin
  if (rst)
    idelay_ld_rst <= #1 1'b1;
  else if (rst_r4)
    idelay_ld_rst <= #1 1'b0;
end    