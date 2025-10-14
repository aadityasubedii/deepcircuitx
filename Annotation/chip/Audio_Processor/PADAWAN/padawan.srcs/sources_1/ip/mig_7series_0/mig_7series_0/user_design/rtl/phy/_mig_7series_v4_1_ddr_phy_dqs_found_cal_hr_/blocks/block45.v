  always @(posedge clk) begin
    pi_dqs_found_lanes_r1   <= #TCQ pi_dqs_found_lanes;
    pi_dqs_found_lanes_r2   <= #TCQ pi_dqs_found_lanes_r1;
    pi_dqs_found_lanes_r3   <= #TCQ pi_dqs_found_lanes_r2;
    init_dqsfound_done_r1   <= #TCQ init_dqsfound_done_r;
    init_dqsfound_done_r2   <= #TCQ init_dqsfound_done_r1;
    init_dqsfound_done_r3   <= #TCQ init_dqsfound_done_r2;
    init_dqsfound_done_r4   <= #TCQ init_dqsfound_done_r3;
    init_dqsfound_done_r5   <= #TCQ init_dqsfound_done_r4;
    rank_done_r1            <= #TCQ rank_done_r;
    dqsfound_retry_r1       <= #TCQ dqsfound_retry;
  end