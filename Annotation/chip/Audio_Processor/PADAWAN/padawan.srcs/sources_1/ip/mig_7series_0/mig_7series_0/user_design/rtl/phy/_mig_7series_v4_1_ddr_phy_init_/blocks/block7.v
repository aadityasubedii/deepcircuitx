        always @(posedge clk) begin
          phy_address[(r*ROW_WIDTH) +: ROW_WIDTH] <= #TCQ address_w;
          phy_bank[(r*BANK_WIDTH) +: BANK_WIDTH]  <= #TCQ bank_w;
        end