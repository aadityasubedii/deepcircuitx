  always @(posedge clk)
    if (rst)
      pi_dqs_found_done_r1 <= #TCQ 1'b0;
    else
      pi_dqs_found_done_r1 <= #TCQ pi_dqs_found_done;
