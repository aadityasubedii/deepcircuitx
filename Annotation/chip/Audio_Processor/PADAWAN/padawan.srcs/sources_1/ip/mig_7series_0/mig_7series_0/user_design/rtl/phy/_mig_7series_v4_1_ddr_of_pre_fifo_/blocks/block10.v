  always @ (posedge clk)
    if (wr_en)
      mem[wr_ptr] <= #TCQ d_in;