  assign input_ge1 = |input_tm_cnt;
  assign input_ge2 = input_tm_cnt[1];
  assign input_ge3 = &input_tm_cnt;
  assign overflow_pending_atm = {overflow_pending, atm[34 : 0]};
  assign overflow_pending_dtm = {overflow_pending, dtm[34 : 0]};