  generate
    begin : maintenance_request


      reg upd_last_master_r;
      reg new_maint_rank_r;
      wire maint_busy = upd_last_master_r || new_maint_rank_r ||
                        maint_req_r_lcl || maint_wip_r;
      wire [RANKS+1:0] maint_request = {sre_request, zq_request, refresh_request[RANKS-1:0]};
      
      wire upd_last_master_ns = |maint_request && ~maint_wip_r;