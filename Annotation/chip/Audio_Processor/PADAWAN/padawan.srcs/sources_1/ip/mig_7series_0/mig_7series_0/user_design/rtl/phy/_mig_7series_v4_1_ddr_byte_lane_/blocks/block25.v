always @(posedge phy_clk)  begin
   ififo_rst <= #1  pi_rst_dqs_find | if_rst ;

   ofifo_rst <= #1 (pi_rst_dqs_find & PO_DATA_CTL == "TRUE") | rst;
end