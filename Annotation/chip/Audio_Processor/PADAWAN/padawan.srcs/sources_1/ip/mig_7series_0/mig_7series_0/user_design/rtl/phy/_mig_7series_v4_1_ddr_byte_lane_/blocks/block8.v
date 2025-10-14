  end else begin: pahser_in_div4_clk
    assign pi_phase_locked     = pi_phase_locked_w;
    assign pi_dqs_found        = pi_dqs_found_w;
    assign pi_counter_read_val = pi_counter_read_val_w;
  end