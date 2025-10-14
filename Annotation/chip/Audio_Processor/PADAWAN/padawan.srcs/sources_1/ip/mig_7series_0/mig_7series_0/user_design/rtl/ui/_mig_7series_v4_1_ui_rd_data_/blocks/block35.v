        always @(posedge clk) app_ecc_single_err_r <= #TCQ ecc_single;
      end
    end