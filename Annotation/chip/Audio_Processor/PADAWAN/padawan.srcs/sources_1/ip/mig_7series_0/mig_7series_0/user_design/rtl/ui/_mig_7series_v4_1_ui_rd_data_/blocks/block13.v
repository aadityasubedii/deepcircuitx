      if (ECC != "OFF") begin : assign_app_ecc_multiple
        wire [(2*nCK_PER_CLK)-1:0] app_ecc_multiple_err_ns =
                              bypass
                                ? ecc_multiple
                                : rd_buf_out_data[APP_DATA_WIDTH+:(2*nCK_PER_CLK)];