    for (m = 0; m < DQ_WIDTH; m = m + 1) begin: gen_dq_inout
      
      assign mem_dq_in[40*FULL_DATA_MAP[(12*m+8)+:3] +
                       10*FULL_DATA_MAP[(12*m+4)+:2] +
                       FULL_DATA_MAP[12*m+:4]]
               = in_dq[m];
      
      assign out_dq[m]
               = mem_dq_out[48*FULL_DATA_MAP[(12*m+8)+:3] +
                            12*FULL_DATA_MAP[(12*m+4)+:2] +
                            FULL_DATA_MAP[12*m+:4]];
      assign ts_dq[m]
               = mem_dq_ts[48*FULL_DATA_MAP[(12*m+8)+:3] +
                           12*FULL_DATA_MAP[(12*m+4)+:2] +
                           FULL_DATA_MAP[12*m+:4]];
      for (n = 0; n < PHASE_PER_CLK; n = n + 1) begin: loop_xpose
        assign phy_dout[320*FULL_DATA_MAP[(12*m+8)+:3] +
                        80*FULL_DATA_MAP[(12*m+4)+:2] +
                        8*FULL_DATA_MAP[12*m+:4] + n]
                 = mux_wrdata[DQ_WIDTH*n + m];
      end