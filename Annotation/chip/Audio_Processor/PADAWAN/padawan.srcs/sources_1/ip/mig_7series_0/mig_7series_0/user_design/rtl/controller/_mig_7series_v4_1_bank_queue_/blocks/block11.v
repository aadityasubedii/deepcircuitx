  generate
    if (nBANK_MACHS > 1) begin : rb_hit_busies



      wire [nBANK_MACHS-2:0] clear_vector =
                ({nBANK_MACHS-1{rst}} | bm_end_in[`BM_SHARED_BV]);



      wire [`BM_SHARED_BV] rb_hit_busies_ns =
                ~clear_vector &
                (idle_ns_lcl
                   ? rb_hit_busy_ns_in[`BM_SHARED_BV]
                   : rb_hit_busies_r_lcl[`BM_SHARED_BV]);