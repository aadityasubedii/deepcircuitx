  generate
    if (EARLY_WR_DATA_ADDR == "OFF") begin : early_wr_addr_arb_off
      assign grant_col_wr = {nBANK_MACHS{1'b0}};
    end
    else begin : early_wr_addr_arb_on
      wire [nBANK_MACHS-1:0] grant_col_wr_raw;
      mig_7series_v4_1_round_robin_arb #
        (.WIDTH                           (nBANK_MACHS))
        col_arb0
          (.grant_ns                      (grant_col_wr_raw),
           .grant_r                       (),
           .upd_last_master               (sent_col_lcl),
           .current_master                (grant_col_r_lcl[nBANK_MACHS-1:0]),
           .clk                           (clk),
           .rst                           (rst),
           .req                           (col_rdy_wr),
           .disable_grant                 (1'b0));
      reg [nBANK_MACHS-1:0] grant_col_wr_r;
      wire [nBANK_MACHS-1:0] grant_col_wr_ns = granted_col_ns
                                                 ? grant_col_wr_raw
                                                 : grant_col_wr_r;