      always @(periodic_rd_grant_r or periodic_rd_rank_r_lcl
               or upd_last_master_r) begin
        periodic_rd_rank_ns = periodic_rd_rank_r_lcl;
        if (upd_last_master_r)
          for (i=0; i<RANKS; i=i+1)
            if (periodic_rd_grant_r[i])
                  periodic_rd_rank_ns = i[RANK_WIDTH-1:0];
      end