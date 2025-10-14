      always @(maint_grant_r or maint_rank_r_lcl or maint_zq_ns
               or maint_sre_ns or maint_srx_ns or present or rst
               or upd_last_master_pls) begin
        if (rst) maint_rank_ns = {RANK_WIDTH{1'b0}};
        else begin
          maint_rank_ns = maint_rank_r_lcl;
          if (maint_zq_ns || maint_sre_ns || maint_srx_ns) begin
            maint_rank_ns = maint_rank_r_lcl + ONE[RANK_WIDTH-1:0];
            for (i=0; i<8; i=i+1)
              if (~present[maint_rank_ns])
                     maint_rank_ns = maint_rank_ns + ONE[RANK_WIDTH-1:0];
          end
          else
            if (upd_last_master_pls)
              for (i=0; i<RANKS; i=i+1)
                if (maint_grant_r[i]) maint_rank_ns = i[RANK_WIDTH-1:0];
        end
      end