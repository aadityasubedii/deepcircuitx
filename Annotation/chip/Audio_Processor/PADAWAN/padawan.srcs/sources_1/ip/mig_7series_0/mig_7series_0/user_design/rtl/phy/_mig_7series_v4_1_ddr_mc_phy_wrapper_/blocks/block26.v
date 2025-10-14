      assign out_addr[m]
               = mem_dq_out[48*ADDR_MAP[(12*m+8)+:3] +
                            12*ADDR_MAP[(12*m+4)+:2] +
                            ADDR_MAP[12*m+:4]];