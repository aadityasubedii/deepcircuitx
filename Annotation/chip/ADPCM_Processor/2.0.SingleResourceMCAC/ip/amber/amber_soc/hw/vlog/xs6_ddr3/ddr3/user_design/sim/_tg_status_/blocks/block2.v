always @ (posedge clk_i)
    data_error_r <= #TCQ  data_error_i;
