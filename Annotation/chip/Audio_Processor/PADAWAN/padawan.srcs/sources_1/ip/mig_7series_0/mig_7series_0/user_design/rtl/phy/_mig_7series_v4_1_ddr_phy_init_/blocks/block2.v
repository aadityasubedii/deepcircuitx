          always @(posedge clk) 
            if (chip_cnt_r == 2'b00) begin 
              phy_address[(r*ROW_WIDTH) + s] <= #TCQ address_w[s];
            end else begin 
              phy_address[(r*ROW_WIDTH) + s] <= #TCQ address_w[
                                                      (s == 3) ? 4 : 
                                                     ((s == 4) ? 3 :
                                                     ((s == 5) ? 6 : 
                                                     ((s == 6) ? 5 :
                                                     ((s == 7) ? 8 : 
                                                     ((s == 8) ? 7 : s)))))];
            end
        end
      end