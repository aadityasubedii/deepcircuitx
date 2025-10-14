      always @(idle_ns or periodic_rd_insert
               or periodic_rd_rank_r or rank or req_rank_r_lcl) req_rank_ns = idle_ns
                                  ? periodic_rd_insert
                                      ? periodic_rd_rank_r
                                      : rank
                                  : req_rank_r_lcl;