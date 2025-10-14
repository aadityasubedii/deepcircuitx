  assign E_valid = E_valid_from_R & ~E_rf_ecc_valid_any;
  assign E_stall = (E_shift_rot_stall | E_ld_stall | E_st_stall | E_ci_multi_stall) & ~(E_rf_ecc_valid_any|W_rf_ecc_valid_any|W1_rf_ecc_recoverable_valid);
  assign E_arith_src1 = { E_src1[31] ^ E_invert_arith_src_msb, 
    E_src1[30 : 0]};

  assign E_arith_src2 = { E_src2[31] ^ E_invert_arith_src_msb, 
    E_src2[30 : 0]};

  assign E_arith_result = E_alu_sub ?
    E_arith_src1 - E_arith_src2 :
    E_arith_src1 + E_arith_src2;

  assign E_mem_baddr = E_arith_result[28 : 0];
  assign E_logic_result = (R_logic_op == 2'b00)? (~(E_src1 | E_src2)) :
    (R_logic_op == 2'b01)? (E_src1 & E_src2) :
    (R_logic_op == 2'b10)? (E_src1 | E_src2) :
    (E_src1 ^ E_src2);

  assign E_logic_result_is_0 = E_logic_result == 0;
  assign E_eq = E_logic_result_is_0;
  assign E_lt = E_arith_result[32];
  assign E_cmp_result = (R_compare_op == 2'b00)? E_eq :
    (R_compare_op == 2'b01)? ~E_lt :
    (R_compare_op == 2'b10)? E_lt :
    ~E_eq;

  assign E_shift_rot_shfcnt = E_src2[4 : 0];
  assign E_shift_rot_cnt_nxt = E_new_inst ? E_shift_rot_shfcnt : E_shift_rot_cnt-1;
  assign E_shift_rot_done = (E_shift_rot_cnt == 0) & ~E_new_inst;
  assign E_shift_rot_stall = R_ctrl_shift_rot & E_valid & ~E_shift_rot_done;