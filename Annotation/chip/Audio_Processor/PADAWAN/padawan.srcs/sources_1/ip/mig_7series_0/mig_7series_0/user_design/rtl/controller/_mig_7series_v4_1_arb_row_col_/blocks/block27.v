          always @(sent_col_lcl) begin
            cs_en0 = sent_col_lcl;
            send_cmd0_col = sent_col_lcl;
          end