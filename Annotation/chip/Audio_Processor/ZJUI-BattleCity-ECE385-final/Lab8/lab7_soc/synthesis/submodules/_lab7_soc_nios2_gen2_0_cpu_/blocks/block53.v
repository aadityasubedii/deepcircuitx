  assign D_ctrl_ld_signed = D_op_ldb|D_op_ldh|D_op_ldw|D_op_ldbio|D_op_ldhio|D_op_ldwio;
  assign R_ctrl_ld_signed_nxt = D_ctrl_ld_signed;