      always @(send_cmd2_row or send_cmd2_col or send_cmd2_pre or send_cmd3_col or row_cmd_ns or col_cmd_ns or pre_cmd_ns) begin
        cmd2 = {OUT_CMD_WIDTH{1'b1}};
        cmd3 = {OUT_CMD_WIDTH{1'b1}};
        if (send_cmd2_row) cmd2 = row_cmd_ns;
        if (send_cmd2_col) cmd2 = col_cmd_ns;
        if (send_cmd2_pre) cmd2 = pre_cmd_ns;
        if (send_cmd3_col) cmd3 = col_cmd_ns;
      end