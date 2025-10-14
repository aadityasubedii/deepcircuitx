  always @ (posedge clk)
  begin
    if (rst) begin
      wr_ptr <= 'b0;
      wr_ptr_timing <= 'b0;
    end
    else if ((wr_en_in) & ((!my_empty[5] & !full_in) | (!my_full[1] & full_in))) begin
      wr_ptr <= nxt_wr_ptr;
      wr_ptr_timing <= nxt_wr_ptr;
    end
  end