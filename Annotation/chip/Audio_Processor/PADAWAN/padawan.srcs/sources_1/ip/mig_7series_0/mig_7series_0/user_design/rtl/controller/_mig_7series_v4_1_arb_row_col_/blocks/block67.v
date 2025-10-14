    else begin : row_col_1T_arb
      assign col_request = rts_col & {nBANK_MACHS{~rnk_config_kill_rts_col_lcl}};
      assign block_grant_row = 1'b0;
      assign block_grant_col = 1'b0;
    end