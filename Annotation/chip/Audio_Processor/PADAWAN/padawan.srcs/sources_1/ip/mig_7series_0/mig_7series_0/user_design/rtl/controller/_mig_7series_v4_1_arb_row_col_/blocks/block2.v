          always @(sent_col_lcl) begin
            cs_en3 = sent_col_lcl;
            send_cmd2_col = sent_col_lcl;
            send_cmd3_col = sent_col_lcl;
          end