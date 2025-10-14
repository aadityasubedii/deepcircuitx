  output wire demand_priority;
  assign demand_priority = demand_priority_r && ~demanded_prior_r &&
                           ~sending_col;