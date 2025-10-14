          always @(sent_col_lcl) begin
            cs_en1 = sent_col_lcl;
            send_cmd1_col = sent_col_lcl;
          end