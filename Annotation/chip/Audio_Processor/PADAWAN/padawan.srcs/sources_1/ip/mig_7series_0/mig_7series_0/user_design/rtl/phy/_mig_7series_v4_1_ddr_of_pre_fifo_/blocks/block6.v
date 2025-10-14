  always @ (posedge clk)
  begin
    if (rst)
      my_empty <= 9'h1ff;
    else begin
      if (my_empty[2] & !my_full[3] & full_in & wr_en_in)
        my_empty[3:0] <= 4'b0000;
      else if (!my_empty[2] & !my_full[3] & !full_in & !wr_en_in) begin
        my_empty[0] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[1] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[2] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[3] <= (nxt_rd_ptr == wr_ptr_timing);
      end
      if (my_empty[8] & !my_full[5] & full_in & wr_en_in)
        my_empty[8:4] <= 5'b00000;
      else if (!my_empty[8] & !my_full[5] & !full_in & !wr_en_in) begin
        my_empty[4] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[5] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[6] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[7] <= (nxt_rd_ptr == wr_ptr_timing);
        my_empty[8] <= (nxt_rd_ptr == wr_ptr_timing);
      end
    end
  end