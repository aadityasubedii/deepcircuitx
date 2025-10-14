          always @(sent_col_lcl) begin
            send_cmd0_col = sent_col_lcl;
            send_cmd1_col = sent_col_lcl;
          end