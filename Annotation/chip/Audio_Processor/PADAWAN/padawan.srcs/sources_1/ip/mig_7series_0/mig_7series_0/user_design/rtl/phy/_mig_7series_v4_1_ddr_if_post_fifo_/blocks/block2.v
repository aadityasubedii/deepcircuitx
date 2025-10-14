  always @ (posedge clk)
  begin
    if (wr_en)
      mem[wr_ptr] <= #TCQ d_in;
  end