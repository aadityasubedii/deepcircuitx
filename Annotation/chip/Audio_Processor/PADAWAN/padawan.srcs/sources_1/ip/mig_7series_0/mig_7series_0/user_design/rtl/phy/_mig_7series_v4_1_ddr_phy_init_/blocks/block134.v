  always @(posedge clk)
    read_calib_r <= #TCQ read_calib_int;
 