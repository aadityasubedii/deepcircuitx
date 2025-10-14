  always @ (posedge clk)
  begin
    if(write & clear)
      fifo[0] <=#Tp data_in;
    else
   if(write & ~full)
      fifo[write_pointer] <=#Tp data_in;
  end