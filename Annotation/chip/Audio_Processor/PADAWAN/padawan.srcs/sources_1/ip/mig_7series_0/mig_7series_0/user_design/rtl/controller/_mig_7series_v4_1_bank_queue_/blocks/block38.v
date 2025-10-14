      always @(accept_req or accept_this_bm
               or bm_end_in or bm_end_lcl or idle_r_lcl
               or idlers_above or rb_hit_busy_r or rst or tail_r_lcl) begin
        if (rst) tail_ns = (ID == nBANK_MACHS);


        else begin
          tail_ns = tail_r_lcl;
          if ((accept_req && rb_hit_busy_r) ||
               (|bm_end_in[`BM_SHARED_BV] && idle_r_lcl))
            tail_ns = 1'b0;
          if (accept_this_bm || (bm_end_lcl && ~idlers_above)) tail_ns = 1'b1;
         end
       end