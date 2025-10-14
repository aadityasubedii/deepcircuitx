  always @(posedge clk)
    cnt_cmd_done_m7_r <= #TCQ (cnt_cmd_r == (CNTNEXT_CMD - 7));
