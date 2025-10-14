  assign D_ctrl_mem8 = D_op_ldb|D_op_ldbu|D_op_ldbio|D_op_ldbuio|D_op_stb|D_op_stbio;
  assign R_ctrl_mem8_nxt = D_ctrl_mem8;