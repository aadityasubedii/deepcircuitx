    always @ (posedge phy_clk) begin
      if (rst)
        pi_phase_locked_r4 <= 1'b0;
      else if (pi_phase_locked_r2 == pi_phase_locked_r3)
        pi_phase_locked_r4 <= pi_phase_locked_r3;
    end