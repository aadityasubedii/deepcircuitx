      always @(rst or write_this_rank or wtr_cnt_r)
        if (rst) wtr_cnt_ns = {WTR_CNT_WIDTH{1'b0}};
        else begin
          wtr_cnt_ns = wtr_cnt_r;
          if (write_this_rank) wtr_cnt_ns =
                 CASWR2CASRD_CLKS[WTR_CNT_WIDTH-1:0] - ONE[WTR_CNT_WIDTH-1:0];
          else if (|wtr_cnt_r) wtr_cnt_ns = wtr_cnt_r - ONE[WTR_CNT_WIDTH-1:0];
        end