  generate
    if (ECC_TEST == "OFF") assign raw_not_ecc = {2*nCK_PER_CLK{1'b0}};
    else assign raw_not_ecc = wr_buf_out_data[WR_BUF_WIDTH-1-:(2*nCK_PER_CLK)];
  endgenerate