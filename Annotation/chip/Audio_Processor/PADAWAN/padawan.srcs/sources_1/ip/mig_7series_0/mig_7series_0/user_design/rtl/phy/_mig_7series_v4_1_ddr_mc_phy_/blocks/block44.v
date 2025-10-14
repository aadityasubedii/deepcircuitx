always @(posedge phy_clk) begin
    if ( rst)
       mcGo_r <= #(1) 0;
    else
       mcGo_r <= #(1) (mcGo_r << 1) |  &mcGo_w;
end