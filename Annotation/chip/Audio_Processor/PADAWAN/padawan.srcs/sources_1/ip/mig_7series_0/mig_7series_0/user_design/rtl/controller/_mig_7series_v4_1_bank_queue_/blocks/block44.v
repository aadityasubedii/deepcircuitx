always @ (*)
begin
  if (accept_req & bm_end_lcl)
    q_entry_ns  = temp - BM_CNT_ONE;
  else if (bm_end_lcl)
    q_entry_ns = temp;
  else if (accept_this_bm) 
    q_entry_ns = adv_queue ? (rb_hit_busy_cnt - BM_CNT_ONE) :  (rb_hit_busy_cnt -BM_CNT_ZERO);
  else if ((!idle_r_lcl & adv_queue) |
          (idle_r_lcl & accept_req & !accept_this_bm))
    q_entry_ns = q_entry_r - BM_CNT_ONE;
  else
  q_entry_ns = q_entry_r;
end