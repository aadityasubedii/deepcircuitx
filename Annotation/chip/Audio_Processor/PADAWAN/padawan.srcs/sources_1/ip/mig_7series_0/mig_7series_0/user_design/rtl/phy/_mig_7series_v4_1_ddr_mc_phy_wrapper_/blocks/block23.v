        assign out_ba[m]
                 = mem_dq_out[48*BANK_MAP[(12*m+8)+:3] +
                              12*BANK_MAP[(12*m+4)+:2] +
                              BANK_MAP[12*m+:4]];