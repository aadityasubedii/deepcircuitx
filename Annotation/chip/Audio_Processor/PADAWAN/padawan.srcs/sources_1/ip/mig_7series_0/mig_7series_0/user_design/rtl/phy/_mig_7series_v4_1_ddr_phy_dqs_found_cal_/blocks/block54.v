  generate
  if ((HIGHEST_LANE == 4) || (HIGHEST_LANE == 8) || (HIGHEST_LANE == 12))
    assign pi_dqs_found_lanes_int = pi_dqs_found_lanes_r3;
  else if ((HIGHEST_LANE == 3) || (HIGHEST_LANE == 7) || (HIGHEST_LANE == 11))
    assign pi_dqs_found_lanes_int = {1'b0, pi_dqs_found_lanes_r3};
  else if ((HIGHEST_LANE == 6) || (HIGHEST_LANE == 10))
    assign pi_dqs_found_lanes_int = {2'b00, pi_dqs_found_lanes_r3};
  else if ((HIGHEST_LANE == 5) || (HIGHEST_LANE == 9))
    assign pi_dqs_found_lanes_int = {3'b000, pi_dqs_found_lanes_r3};
  endgenerate