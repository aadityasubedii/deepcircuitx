  assign D_ctrl_uncond_cti_non_br = D_op_call|D_op_jmpi|D_op_eret|D_op_bret|D_op_ret|D_op_jmp|D_op_callr;
  assign R_ctrl_uncond_cti_non_br_nxt = D_ctrl_uncond_cti_non_br;