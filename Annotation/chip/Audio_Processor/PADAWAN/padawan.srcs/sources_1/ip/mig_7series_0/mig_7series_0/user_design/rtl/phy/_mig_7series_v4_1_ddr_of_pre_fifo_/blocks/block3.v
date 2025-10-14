  always @ (posedge clk)
  begin
    if (rst)
      my_full <= 6'b000000;
    else if (!my_empty[6] & my_full[0] & !full_in & !wr_en_in)
      my_full <= 6'b000000;
    else if (!my_empty[6] & !my_full[0] & full_in & wr_en_in) begin
      my_full[0] <= (nxt_wr_ptr == rd_ptr_timing);
      my_full[1] <= (nxt_wr_ptr == rd_ptr_timing);
      my_full[2] <= (nxt_wr_ptr == rd_ptr_timing);
      my_full[3] <= (nxt_wr_ptr == rd_ptr_timing);
      my_full[4] <= (nxt_wr_ptr == rd_ptr_timing);
      my_full[5] <= (nxt_wr_ptr == rd_ptr_timing);
    end
  end