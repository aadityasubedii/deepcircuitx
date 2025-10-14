  always @ (posedge clk)
  begin
    if(clear)
      data_out <=#Tp fifo[0];
    else
      data_out <=#Tp fifo[read_pointer];
  end