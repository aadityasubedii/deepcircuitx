        always @(posedge clk) app_ecc_single_err_r <= 
                                #TCQ app_ecc_single_err_ns;
      end