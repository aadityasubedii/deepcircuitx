  generate
    if ((nCK_PER_CLK == 2) || (nCK_PER_CLK == 4))
      always @(send_cmd1_row or send_cmd1_col or row_cmd_ns or col_cmd_ns or pre_cmd_ns) begin