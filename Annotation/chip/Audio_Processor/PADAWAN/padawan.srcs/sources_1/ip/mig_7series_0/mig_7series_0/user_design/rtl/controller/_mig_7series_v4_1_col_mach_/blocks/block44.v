        always @(posedge clk) offset_r[0] <= #TCQ offset_ns[0];
        assign data_end = col_size ? offset_r[0] : 1'b1;

      end