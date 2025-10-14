       always @(act_req or act_starve_limit_cntr_r or rts_act_denied)
         begin
           act_starve_limit_cntr_ns = act_starve_limit_cntr_r;
           if (~act_req)
             act_starve_limit_cntr_ns = {BM_CNT_WIDTH{1'b0}};
           else
             if (rts_act_denied && &act_starve_limit_cntr_r)
               act_starve_limit_cntr_ns = act_starve_limit_cntr_r +
                                          {{BM_CNT_WIDTH-1{1'b0}}, 1'b1};
         end