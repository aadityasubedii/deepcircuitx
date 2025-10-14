          always @(sent_row_or_maint_r or sent_col_lcl_r)
            cs_en0 = sent_row_or_maint_r || sent_col_lcl_r;
