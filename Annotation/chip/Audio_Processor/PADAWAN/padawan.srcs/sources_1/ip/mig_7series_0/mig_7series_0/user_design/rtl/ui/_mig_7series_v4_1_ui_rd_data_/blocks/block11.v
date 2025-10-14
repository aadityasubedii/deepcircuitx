      if (ECC != "OFF") begin : assign_app_ecc_single
        wire [(2*nCK_PER_CLK)-1:0] app_ecc_single_err_ns =
                              bypass
                                ? ecc_single
                                : rd_buf_out_data[(APP_DATA_WIDTH+(2*nCK_PER_CLK))+:(2*nCK_PER_CLK)];