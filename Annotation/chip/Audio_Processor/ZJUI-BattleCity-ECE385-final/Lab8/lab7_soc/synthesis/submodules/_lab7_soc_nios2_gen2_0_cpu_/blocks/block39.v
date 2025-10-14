  assign D_ctrl_st = D_op_stb|D_op_sth|D_op_stw|D_op_stbio|D_op_sthio|D_op_stwio;
  assign R_ctrl_st_nxt = D_ctrl_st;