    always @ (posedge phy_clk) begin
      if (rst)
        pi_dqs_found_r4 <= 1'b0;
      else if (pi_dqs_found_r2 == pi_dqs_found_r3)
        pi_dqs_found_r4 <= pi_dqs_found_r3;
    end