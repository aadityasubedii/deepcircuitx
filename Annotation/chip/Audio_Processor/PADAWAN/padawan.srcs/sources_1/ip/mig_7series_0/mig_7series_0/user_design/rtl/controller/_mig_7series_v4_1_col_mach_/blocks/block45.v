        always @(col_size or rst or sent_col)
          offset_ns[0] = rst ? 1'b0 : sent_col && col_size;