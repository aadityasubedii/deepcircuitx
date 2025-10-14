      always @(granted_col_d_r or sent_col)
                dq_busy_data = sent_col || |granted_col_d_r;
    end