      always @(posedge clk) begin
        phy_rddata_valid_r <= #TCQ phy_rddata_valid;
        rd_rmw_r <= #TCQ rd_rmw;
      end   