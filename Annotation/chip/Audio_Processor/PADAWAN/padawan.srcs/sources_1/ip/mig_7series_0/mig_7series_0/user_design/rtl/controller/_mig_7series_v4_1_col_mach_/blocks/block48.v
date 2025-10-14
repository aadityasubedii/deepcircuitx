        always @(col_size or offset_r or rst or sent_col) begin
          if (rst) offset_ns = 2'b0;
          else begin
            offset_ns = offset_r;
            if (sent_col) offset_ns = 2'b1;
            else if (|offset_r && (offset_r != {col_size, 1'b1}))
              offset_ns = offset_r + 2'b1;
            else offset_ns = 2'b0;
          end
        
        end