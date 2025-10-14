    always @ (posedge phy_clk) begin
      if (rst)
        pi_counter_read_val_r4 <= 1'b0;
      else if (pi_counter_read_val_r2 == pi_counter_read_val_r3)
        pi_counter_read_val_r4 <= pi_counter_read_val_r3;
    end