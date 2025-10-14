          always @(sent_col_lcl or sent_row_or_maint)
            cs_en1 = sent_row_or_maint || sent_col_lcl;
