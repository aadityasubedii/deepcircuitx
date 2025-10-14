  always @(posedge clk) begin
    pi_dqs_found_rank_done_r <= #TCQ pi_dqs_found_rank_done;
    pi_phase_locked_all_r1   <= #TCQ pi_phase_locked_all;
    pi_phase_locked_all_r2   <= #TCQ pi_phase_locked_all_r1;
    pi_phase_locked_all_r3   <= #TCQ pi_phase_locked_all_r2;
    pi_phase_locked_all_r4   <= #TCQ pi_phase_locked_all_r3;
    pi_dqs_found_all_r       <= #TCQ pi_dqs_found_done;
    pi_calib_done_r1         <= #TCQ pi_calib_done_r;
  end