      if (REMAINDER == 0)
        assign fifo_in_data = real_fifo_data;
      else
        assign fifo_in_data = {{6-REMAINDER{1'b0}}, real_fifo_data};