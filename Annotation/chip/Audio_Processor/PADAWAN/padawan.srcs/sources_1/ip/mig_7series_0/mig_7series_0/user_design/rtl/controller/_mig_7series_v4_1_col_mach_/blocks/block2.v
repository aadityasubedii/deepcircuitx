        always @(posedge clk) wr_ecc_buf <= #TCQ wr_ecc_buf_ns;
      end
    end