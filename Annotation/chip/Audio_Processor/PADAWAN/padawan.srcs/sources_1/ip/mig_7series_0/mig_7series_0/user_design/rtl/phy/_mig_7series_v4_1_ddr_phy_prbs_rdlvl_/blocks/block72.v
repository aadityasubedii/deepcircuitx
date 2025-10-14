  always @ (posedge clk)
    if (rst) double_window_ind <= #TCQ 1'd0;
    else double_window_ind  <= #TCQ double_window_ind? 1'b1: (valid_window_cnt > 1);