  always @(accept_req or allow_auto_pre or auto_pre_r_lcl
           or clear_req or maint_hit_this_bm or rb_hit_busy_r
           or row_hit_r or tail_r_lcl or wait_for_maint_r_lcl) begin
    auto_pre_ns = auto_pre_r_lcl;
    if (clear_req) auto_pre_ns = 1'b0;
    else
      if (accept_req && tail_r_lcl && allow_auto_pre && rb_hit_busy_r &&
          (~row_hit_r || (maint_hit_this_bm && ~wait_for_maint_r_lcl)))
        auto_pre_ns = 1'b1;
  end