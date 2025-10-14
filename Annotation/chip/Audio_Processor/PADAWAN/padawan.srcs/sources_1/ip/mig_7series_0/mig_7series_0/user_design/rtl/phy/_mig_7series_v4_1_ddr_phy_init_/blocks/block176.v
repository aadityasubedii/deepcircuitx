  always @(posedge clk)
    cnt_cmd_done_r <= #TCQ (cnt_cmd_r == CNTNEXT_CMD);
 