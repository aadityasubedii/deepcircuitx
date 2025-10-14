      always @(posedge clk) rb_hit_busies_r_lcl[`BM_SHARED_BV] <=
                             #TCQ rb_hit_busies_ns;
