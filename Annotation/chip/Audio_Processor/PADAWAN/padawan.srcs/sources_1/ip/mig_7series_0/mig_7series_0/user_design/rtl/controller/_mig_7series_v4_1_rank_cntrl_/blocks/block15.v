      wire my_refresh =
        insert_maint_r1 && ~maint_zq_r && ~maint_sre_r && ~maint_srx_r &&
        (maint_rank_r == ID[RANK_WIDTH-1:0]);