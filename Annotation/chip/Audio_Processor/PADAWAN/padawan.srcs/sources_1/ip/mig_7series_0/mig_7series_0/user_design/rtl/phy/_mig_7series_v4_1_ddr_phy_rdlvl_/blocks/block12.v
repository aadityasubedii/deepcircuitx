  always @(posedge clk)
    if (pb_detect_edge_setup)
      found_stable_eye_last_r <= #TCQ 1'b0;
    else if (detect_edge_done_r)
      found_stable_eye_last_r <= #TCQ found_stable_eye_r;