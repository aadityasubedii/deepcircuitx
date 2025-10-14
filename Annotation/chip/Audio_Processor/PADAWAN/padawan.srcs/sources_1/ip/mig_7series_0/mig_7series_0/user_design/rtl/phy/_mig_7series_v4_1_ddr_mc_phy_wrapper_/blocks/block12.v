    for (m = 0; m < DQS_WIDTH; m = m + 1) begin: gen_dqs_inout
      
      assign mem_dqs_in[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]]
        = in_dqs[m];
      
      assign out_dqs[m]
        = mem_dqs_out[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]];
      assign ts_dqs[m]
        = mem_dqs_ts[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]];
    end