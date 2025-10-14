        always @(posedge clk) offset_r <= #TCQ offset_ns;
        assign data_end = col_size ? (offset_r == 2'b11) : offset_r[0];
        
      end