  always @(ordered_issued_lcl or ordered_r_lcl or rst
           or set_order_q) begin
    if (rst) ordered_ns = 1'b0;
    else begin
      ordered_ns = ordered_r_lcl;

      if (set_order_q) ordered_ns = 1'b1;
      if (ordered_issued_lcl) ordered_ns = 1'b0;
    end
  end