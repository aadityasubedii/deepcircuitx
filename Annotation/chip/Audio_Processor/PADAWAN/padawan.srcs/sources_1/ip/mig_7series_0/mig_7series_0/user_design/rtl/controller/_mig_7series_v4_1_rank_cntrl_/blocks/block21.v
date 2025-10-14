      always @(rst or col_rd_wr or sending_col or rtw_cnt_r)
        if (rst) rtw_cnt_ns = {RTW_CNT_WIDTH{1'b0}};
        else begin
          rtw_cnt_ns = rtw_cnt_r;
          if (col_rd_wr && |sending_col) rtw_cnt_ns =
                 CASRD2CASWR_CLKS[RTW_CNT_WIDTH-1:0] - ONE[RTW_CNT_WIDTH-1:0];
          else if (|rtw_cnt_r) rtw_cnt_ns = rtw_cnt_r - ONE[RTW_CNT_WIDTH-1:0];
        end