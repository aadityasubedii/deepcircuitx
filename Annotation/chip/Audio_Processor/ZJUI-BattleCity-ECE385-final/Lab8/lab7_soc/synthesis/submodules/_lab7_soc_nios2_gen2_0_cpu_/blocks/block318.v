reg     [  1: 0] compute_input_tm_cnt;
wire    [  2: 0] switch_for_mux;
  assign switch_for_mux = {itm_valid, atm_valid, dtm_valid};