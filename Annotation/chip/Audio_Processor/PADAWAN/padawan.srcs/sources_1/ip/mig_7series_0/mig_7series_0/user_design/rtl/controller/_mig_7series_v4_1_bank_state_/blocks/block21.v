  always @(col_wait_r or rts_col_denied or starve_limit_cntr_r)
   if (~col_wait_r)
     starve_limit_cntr_ns = {STARVE_LIMIT_WIDTH{1'b0}};
   else
     if (rts_col_denied && (starve_limit_cntr_r != STARVE_LIMIT_CNT-1))
       starve_limit_cntr_ns = starve_limit_cntr_r +
                              {{STARVE_LIMIT_WIDTH-1{1'b0}}, 1'b1};
     else starve_limit_cntr_ns = starve_limit_cntr_r;