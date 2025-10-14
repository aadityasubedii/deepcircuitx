   (.WIDTH                              (nBANK_MACHS))
    row_arb0
    (.grant_ns                          (),
     .grant_r                           (grant_row_r_lcl[nBANK_MACHS-1:0]),
     .upd_last_master                   (sent_row_lcl),
     .current_master                    (grant_row_r_lcl[nBANK_MACHS-1:0]),
     .clk                               (clk),
     .rst                               (rst),
     .req                               (row_request),
     .disable_grant                     (1'b0));