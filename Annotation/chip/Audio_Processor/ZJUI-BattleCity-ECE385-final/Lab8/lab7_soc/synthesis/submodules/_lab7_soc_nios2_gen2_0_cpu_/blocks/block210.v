  assign F_pcb = {F_pc, 2'b00};
  assign F_pcb_plus_four = {F_pc_plus_one, 2'b00};
  assign F_valid = i_read & ~i_waitrequest;
  assign i_read_nxt = W_valid | W_rf_ecc_unrecoverable_valid | (i_read & i_waitrequest);
  assign i_address = {F_pc, 2'b00};