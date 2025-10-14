          always @(posedge clk)
            if (chip_cnt_r == 2'b00) begin
              phy_bank[(r*BANK_WIDTH) + s] <= #TCQ bank_w[s];
            end else begin
              phy_bank[(r*BANK_WIDTH) + s] <= #TCQ bank_w[(s == 0) ? 1 : ((s == 1) ? 0 : s)];
            end

        end