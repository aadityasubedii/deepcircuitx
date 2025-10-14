  always @(accept_req or accept_this_bm or adv_queue
           or bm_end_lcl or head_r_lcl or idle_cnt or idle_r_lcl
           or idlers_below or q_entry_r or rb_hit_busy_cnt or rst) begin
    if (rst) head_ns = ~|ID[BM_CNT_WIDTH-1:0];
    else begin
      head_ns = head_r_lcl;
      if (accept_this_bm)
        head_ns = ~|(rb_hit_busy_cnt - (adv_queue ? BM_CNT_ONE : BM_CNT_ZERO));
      if ((~idle_r_lcl && adv_queue) ||
           (idle_r_lcl && accept_req && ~accept_this_bm))
        head_ns = ~|(q_entry_r - BM_CNT_ONE);
      if (bm_end_lcl) begin
        head_ns = ~|(idle_cnt - (accept_req ? BM_CNT_ONE : BM_CNT_ZERO)) &&
                   ~|idlers_below;
      end
    end
  end