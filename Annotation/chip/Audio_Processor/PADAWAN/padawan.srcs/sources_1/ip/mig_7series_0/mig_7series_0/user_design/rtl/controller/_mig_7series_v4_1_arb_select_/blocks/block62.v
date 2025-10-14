  assign mc_cmd[0] = sent_col;
  assign mc_cmd[1] = EVEN_CWL_2T_MODE == "ON" ?
                        sent_col && col_rd_wr_r :
                        sent_col && col_rd_wr_ns;
  assign mc_cmd[2] = ~sent_col;