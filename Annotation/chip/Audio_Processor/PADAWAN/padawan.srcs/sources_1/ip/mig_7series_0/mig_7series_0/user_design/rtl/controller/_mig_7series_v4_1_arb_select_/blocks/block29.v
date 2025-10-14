  generate
    if (nCK_PER_CLK == 4)
      always @(send_cmd2_row or send_cmd2_col or send_cmd2_pre or send_cmd3_col or row_cmd_ns or col_cmd_ns or pre_cmd_ns) begin