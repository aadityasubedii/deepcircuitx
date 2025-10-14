        if (CS_MAP[12*m+:4] < 4'hA) begin: gen_lt10
          for (n = 0; n < 4; n = n + 1) begin: loop_xpose
            assign phy_dout[320*CS_MAP[(12*m+8)+:3] +
                            80*CS_MAP[(12*m+4)+:2] +
                            8*CS_MAP[12*m+:4] + n]
                     = mux_cs_n[CS_WIDTH*nCS_PER_RANK*(n/PHASE_DIV) + m];
          end
        end else begin: gen_ge10
          for (n = 0; n < 4; n = n + 1) begin: loop_xpose
            assign phy_dout[320*CS_MAP[(12*m+8)+:3] +
                            80*CS_MAP[(12*m+4)+:2] +
                            8*(CS_MAP[12*m+:4]-5) + 4 + n]
                     = mux_cs_n[CS_WIDTH*nCS_PER_RANK*(n/PHASE_DIV) + m];