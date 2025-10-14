          always @(sent_col_lcl or sent_col_lcl_r) begin
            cs_en0 = sent_col_lcl_r;
            send_cmd0_col = sent_col_lcl_r;
            send_cmd3_col = sent_col_lcl;
          end