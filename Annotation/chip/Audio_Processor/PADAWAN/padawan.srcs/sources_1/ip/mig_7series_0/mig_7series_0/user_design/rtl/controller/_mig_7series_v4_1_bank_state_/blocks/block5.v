  output wire rts_col;
  assign rts_col = ~sending_col && (demand_ok || override_demand_r) &&