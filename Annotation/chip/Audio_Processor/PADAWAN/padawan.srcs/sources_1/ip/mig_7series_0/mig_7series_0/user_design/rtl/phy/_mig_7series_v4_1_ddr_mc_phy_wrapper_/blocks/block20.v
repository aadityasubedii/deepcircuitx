    if (USE_CS_PORT == 1) begin: gen_cs_n_out
      for (m = 0; m < CS_WIDTH*nCS_PER_RANK; m = m + 1) begin: gen_cs_out
        assign out_cs_n[m]
                 = mem_dq_out[48*CS_MAP[(12*m+8)+:3] +
                              12*CS_MAP[(12*m+4)+:2] +
                              CS_MAP[12*m+:4]];