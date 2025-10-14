      always @(posedge clk) granted_pre_r <= #TCQ granted_pre_ns;
      assign sent_pre_lcl = granted_pre_r;
      assign sending_pre = grant_pre_r_lcl;

      mig_7series_v4_1_round_robin_arb #
       (.WIDTH                              (nBANK_MACHS))
        pre_arb0
        (.grant_ns                          (),
         .grant_r                           (grant_pre_r_lcl[nBANK_MACHS-1:0]),
         .upd_last_master                   (sent_pre_lcl),
         .current_master                    (grant_pre_r_lcl[nBANK_MACHS-1:0]),
         .clk                               (clk),
         .rst                               (rst),
         .req                               (rts_pre),
         .disable_grant                     (1'b0));

    end