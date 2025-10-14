      always @(bm_end_in or rb_hit_busies_r_lcl)
        adv_queue =
            |(bm_end_in[`BM_SHARED_BV] & rb_hit_busies_r_lcl[`BM_SHARED_BV]);
