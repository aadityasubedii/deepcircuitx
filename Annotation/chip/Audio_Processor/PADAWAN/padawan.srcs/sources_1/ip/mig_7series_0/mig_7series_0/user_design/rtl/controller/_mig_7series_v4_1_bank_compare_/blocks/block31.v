          always @(posedge clk) req_size <= #TCQ req_size_ns;
          assign req_size_r_lcl = req_size;
        end