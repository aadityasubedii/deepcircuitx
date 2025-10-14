  always @(send_cmd0_row or send_cmd0_col or row_cmd_ns or row_cmd_r or col_cmd_ns or col_cmd_r or cke_ns or cke_r ) begin
    cmd0 = {OUT_CMD_WIDTH{1'b1}};
    if (send_cmd0_row) cmd0 = row_cmd_ns;
    if (send_cmd0_row && EVEN_CWL_2T_MODE == "ON" && nCK_PER_CLK == 2) cmd0 = row_cmd_r;
    if (send_cmd0_col) cmd0 = col_cmd_ns;
    if (send_cmd0_col && EVEN_CWL_2T_MODE == "ON") cmd0 = col_cmd_r;
    if (send_cmd0_row) cke0 = cke_ns;
    else cke0 =  cke_r ;
  end