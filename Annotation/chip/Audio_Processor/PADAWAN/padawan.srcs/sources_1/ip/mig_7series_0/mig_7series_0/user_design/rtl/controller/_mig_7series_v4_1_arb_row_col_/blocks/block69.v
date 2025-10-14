  generate
    if (ADDR_CMD_MODE == "2T" && nCK_PER_CLK != 4) begin : row_col_2T_arb
      assign col_request =
        rts_col & {nBANK_MACHS{~(rnk_config_kill_rts_col_lcl || insert_maint_r)}};

      wire [1:0] row_col_grant;
      wire [1:0] current_master = ~granted_row_ns ? 2'b10 : row_col_grant;
      wire upd_last_master = ~granted_row_ns || |row_col_grant;
      mig_7series_v4_1_round_robin_arb #
        (.WIDTH                       (2))
        row_col_arb0
          (.grant_ns                  (),
           .grant_r                   (row_col_grant),
           .upd_last_master           (upd_last_master),
           .current_master            (current_master),
           .clk                       (clk),
           .rst                       (rst),
           .req                       ({granted_row_ns, granted_col_ns}),
           .disable_grant             (1'b0));
      assign {block_grant_col, block_grant_row} = row_col_grant;
    end
    else begin : row_col_1T_arb
      assign col_request = rts_col & {nBANK_MACHS{~rnk_config_kill_rts_col_lcl}};
      assign block_grant_row = 1'b0;
      assign block_grant_col = 1'b0;
    end
  endgenerate