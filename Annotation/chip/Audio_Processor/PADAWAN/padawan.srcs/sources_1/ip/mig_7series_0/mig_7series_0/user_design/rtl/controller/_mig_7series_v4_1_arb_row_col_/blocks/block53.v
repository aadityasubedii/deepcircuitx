  mig_7series_v4_1_round_robin_arb #
   (.WIDTH                              (nBANK_MACHS))
    config_arb0
    (.grant_ns                          (),
     .grant_r                           (grant_config_r_lcl[nBANK_MACHS-1:0]),
     .upd_last_master                   (upd_rnk_config_last_master),
     .current_master                    (grant_config_r_lcl[nBANK_MACHS-1:0]),
     .clk                               (clk),
     .rst                               (rst),
     .req                               (rtc[nBANK_MACHS-1:0]),
     .disable_grant                     (1'b0));