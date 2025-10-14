`ifdef MC_SVA
  col_wait_for_order_q: cover property
    (@(posedge clk)
        (~rst && col_wait_r && ~order_q_zero && ~dq_busy_data &&
         allow_rw));
  col_wait_for_dq_busy: cover property
    (@(posedge clk)
        (~rst && col_wait_r && order_q_zero && dq_busy_data &&
         allow_rw));
  col_wait_for_allow_rw: cover property
    (@(posedge clk)
        (~rst && col_wait_r && order_q_zero && ~dq_busy_data &&
         ~allow_rw));