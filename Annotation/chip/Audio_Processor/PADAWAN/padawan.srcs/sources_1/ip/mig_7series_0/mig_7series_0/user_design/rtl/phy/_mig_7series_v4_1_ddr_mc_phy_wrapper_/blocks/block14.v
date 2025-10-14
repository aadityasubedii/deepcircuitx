    if (USE_DM_PORT == 1) begin: gen_dm_out
      for (m = 0; m < DM_WIDTH; m = m + 1) begin: gen_dm_out
        assign out_dm[m]
                 = mem_dq_out[48*FULL_MASK_MAP[(12*m+8)+:3] +
                              12*FULL_MASK_MAP[(12*m+4)+:2] +
                              FULL_MASK_MAP[12*m+:4]];
        assign ts_dm[m]
                 = mem_dq_ts[48*FULL_MASK_MAP[(12*m+8)+:3] +
                             12*FULL_MASK_MAP[(12*m+4)+:2] +
                             FULL_MASK_MAP[12*m+:4]];
        for (n = 0; n < PHASE_PER_CLK; n = n + 1) begin: loop_xpose
          assign phy_dout[320*FULL_MASK_MAP[(12*m+8)+:3] +
                          80*FULL_MASK_MAP[(12*m+4)+:2] +
                          8*FULL_MASK_MAP[12*m+:4] + n]
                   = mux_wrdata_mask[DM_WIDTH*n + m];
        end