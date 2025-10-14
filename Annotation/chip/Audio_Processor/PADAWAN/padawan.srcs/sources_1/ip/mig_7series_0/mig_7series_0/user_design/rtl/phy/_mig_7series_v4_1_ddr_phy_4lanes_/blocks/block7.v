generate
  if (HIGHEST_LANE > 1)
    assign B_mux_ctrl = ( !calib_zero_lanes[1] && ( ! calib_zero_ctrl || DATA_CTL_N[1]));
  else
    assign B_mux_ctrl = 0;
  if (HIGHEST_LANE > 2)
    assign C_mux_ctrl = ( !calib_zero_lanes[2] && (! calib_zero_ctrl || DATA_CTL_N[2]));
  else
    assign C_mux_ctrl = 0;
  if (HIGHEST_LANE > 3)
    assign D_mux_ctrl = ( !calib_zero_lanes[3] && ( ! calib_zero_ctrl || DATA_CTL_N[3]));
  else
    assign D_mux_ctrl = 0;
endgenerate