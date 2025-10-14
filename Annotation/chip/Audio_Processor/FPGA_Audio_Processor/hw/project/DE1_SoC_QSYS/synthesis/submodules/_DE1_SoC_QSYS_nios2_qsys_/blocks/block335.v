  always @(ge2_free or ge3_free or input_tm_cnt)
    begin
      if (ge3_free & (input_tm_cnt == 3))
          fifo_wrptr_inc = 3;
      else if (ge2_free & (input_tm_cnt >= 2))
          fifo_wrptr_inc = 2;
      else if (input_tm_cnt >= 1)
          fifo_wrptr_inc = 1;
      else 
        fifo_wrptr_inc = 0;
    end