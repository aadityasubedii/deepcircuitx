  assign break_a_wpr = jdo[35 : 32];
  assign break_a_wpr_high_bits = break_a_wpr[3 : 2];
  assign break_a_wpr_low_bits = break_a_wpr[1 : 0];
  assign break_b_rr = jdo[33 : 32];
  assign break_c_rr = jdo[33 : 32];
  assign take_action_any_break = take_action_break_a | take_action_break_b | take_action_break_c;