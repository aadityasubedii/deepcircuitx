  always @(posedge clk) begin
    detect_edge_done_r <= #TCQ &pb_detect_edge_done_r;
    found_edge_r       <= #TCQ |pb_found_edge_r;
    found_edge_all_r   <= #TCQ &pb_found_edge_r;
    found_stable_eye_r <= #TCQ &pb_found_stable_eye_r;
  end