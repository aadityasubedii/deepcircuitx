          always @(sent_col_lcl or sent_col_lcl_r) begin
            send_cmd0_col = sent_col_lcl_r;
            send_cmd1_col = sent_col_lcl;
          end