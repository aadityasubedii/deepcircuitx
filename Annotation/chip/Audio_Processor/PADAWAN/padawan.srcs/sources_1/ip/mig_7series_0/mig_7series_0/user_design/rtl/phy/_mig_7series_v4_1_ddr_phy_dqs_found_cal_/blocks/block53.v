  always @(posedge clk) begin
    if (rst) begin
      for (k = 0; k < HIGHEST_BANK; k = k + 1) begin: rst_pi_dqs_found
        pi_dqs_found_all_bank[k] <= #TCQ 'b0;
        pi_dqs_found_any_bank[k] <= #TCQ 'b0;
      end
    end else if (pi_dqs_found_start) begin
      for (p = 0; p < HIGHEST_BANK; p = p +1) begin: assign_pi_dqs_found
          pi_dqs_found_all_bank[p] <= #TCQ (!DATA_PRESENT[4*p+0] | pi_dqs_found_lanes_int[4*p+0]) &
                                           (!DATA_PRESENT[4*p+1] | pi_dqs_found_lanes_int[4*p+1]) &
                                           (!DATA_PRESENT[4*p+2] | pi_dqs_found_lanes_int[4*p+2]) &
                                           (!DATA_PRESENT[4*p+3] | pi_dqs_found_lanes_int[4*p+3]);
          pi_dqs_found_any_bank[p] <= #TCQ (DATA_PRESENT[4*p+0] & pi_dqs_found_lanes_int[4*p+0]) |
                                           (DATA_PRESENT[4*p+1] & pi_dqs_found_lanes_int[4*p+1]) |
                                           (DATA_PRESENT[4*p+2] & pi_dqs_found_lanes_int[4*p+2]) |
                                           (DATA_PRESENT[4*p+3] & pi_dqs_found_lanes_int[4*p+3]);
      end
    end
  end