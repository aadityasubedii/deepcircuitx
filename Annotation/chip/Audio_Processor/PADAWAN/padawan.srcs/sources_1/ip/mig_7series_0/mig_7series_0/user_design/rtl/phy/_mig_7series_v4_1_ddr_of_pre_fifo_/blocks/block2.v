  always @ (posedge clk)
  begin
    if (rst)
      entry_cnt <= 'b0;
    else if (wr_en_in & full_in & !my_full[4])
      entry_cnt <= entry_cnt + 1'b1;
    else if (!wr_en_in & !full_in & !my_empty[7])
      entry_cnt <= entry_cnt - 1'b1;
  end