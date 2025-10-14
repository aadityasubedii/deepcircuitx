      always @(posedge clk) begin
        phy_ras_n[3:2] <= #TCQ 3'b11;
        phy_cas_n[3:2] <= #TCQ 3'b11;
        phy_we_n[3:2]  <= #TCQ 3'b11;
      end