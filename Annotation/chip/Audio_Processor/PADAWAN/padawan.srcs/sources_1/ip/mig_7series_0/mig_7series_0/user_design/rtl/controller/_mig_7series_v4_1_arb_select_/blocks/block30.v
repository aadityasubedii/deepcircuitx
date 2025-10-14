      always @(send_cmd1_row or send_cmd1_col or row_cmd_ns or col_cmd_ns or pre_cmd_ns) begin
        cmd1 = {OUT_CMD_WIDTH{1'b1}};
        if (send_cmd1_row) cmd1 = row_cmd_ns;
        if (send_cmd1_col) cmd1 = col_cmd_ns;
      end