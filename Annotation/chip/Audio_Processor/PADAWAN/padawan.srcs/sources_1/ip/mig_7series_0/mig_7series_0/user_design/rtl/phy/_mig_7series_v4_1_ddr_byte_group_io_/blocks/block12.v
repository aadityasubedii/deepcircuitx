always @ (posedge phy_clk) begin
 if(rst)
   fine_delay_r <= #1 1'b0;
 else if(fine_delay_sel)
   fine_delay_r <= #1 fine_delay;
end