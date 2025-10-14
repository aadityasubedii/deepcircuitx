      always @(idle_r_lcl
               or passing_open_bank_in or q_entry_r
               or rb_hit_busies_r_lcl) rcv_open_bank =
    |(rb_hit_busies_r_lcl[`BM_SHARED_BV] & passing_open_bank_in[`BM_SHARED_BV])
      && (q_entry_r == BM_CNT_ONE) && ~idle_r_lcl;
    end