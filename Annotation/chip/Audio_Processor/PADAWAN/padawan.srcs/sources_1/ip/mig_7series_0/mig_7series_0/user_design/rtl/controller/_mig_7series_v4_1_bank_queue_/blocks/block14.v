  always @(adv_order_q or order_cnt or order_q_r or rst
           or set_order_q) begin
    order_q_ns = order_q_r;
    if (rst) order_q_ns = BM_CNT_ZERO;
    if (set_order_q)
      if (adv_order_q) order_q_ns = order_cnt - BM_CNT_ONE;
      else order_q_ns = order_cnt;
    if (adv_order_q && |order_q_r) order_q_ns = order_q_r - BM_CNT_ONE;
  end