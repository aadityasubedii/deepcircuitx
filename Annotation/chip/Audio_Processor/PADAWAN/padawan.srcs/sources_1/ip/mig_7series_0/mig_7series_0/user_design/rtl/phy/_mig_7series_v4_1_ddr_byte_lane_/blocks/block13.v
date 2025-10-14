    always @ (posedge phy_clk) begin
      pi_phase_locked_r1 <= pi_phase_locked_w;
      pi_phase_locked_r2 <= pi_phase_locked_r1;
      pi_phase_locked_r3 <= pi_phase_locked_r2;
      pi_dqs_found_r1    <= pi_dqs_found_w;
      pi_dqs_found_r2    <= pi_dqs_found_r1;
      pi_dqs_found_r3    <= pi_dqs_found_r2;
      pi_counter_read_val_r1 <= pi_counter_read_val_w;
      pi_counter_read_val_r2 <= pi_counter_read_val_r1;
      pi_counter_read_val_r3 <= pi_counter_read_val_r2;
    end