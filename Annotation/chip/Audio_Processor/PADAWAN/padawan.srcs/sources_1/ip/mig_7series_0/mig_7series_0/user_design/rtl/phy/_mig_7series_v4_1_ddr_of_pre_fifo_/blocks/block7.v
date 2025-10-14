  always @ (posedge clk)
  begin
    if (rst) begin
      rd_ptr <= 'b0;
      rd_ptr_timing <= 'b0;
    end
    else if ((!my_empty[4]) & (!full_in)) begin
      rd_ptr <= nxt_rd_ptr;
      rd_ptr_timing <= nxt_rd_ptr;
    end
  end