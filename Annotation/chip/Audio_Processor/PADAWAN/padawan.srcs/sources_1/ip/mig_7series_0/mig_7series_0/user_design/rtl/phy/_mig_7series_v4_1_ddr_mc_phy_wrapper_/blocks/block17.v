     if (USE_ODT_PORT == 1) begin: gen_odt_out
       for (m = 0; m < ODT_WIDTH; m = m + 1) begin: gen_odt_out_1
         assign out_odt[m]
                  = mem_dq_out[48*ODT_MAP[(12*m+8)+:3] +
                               12*ODT_MAP[(12*m+4)+:2] +
                               ODT_MAP[12*m+:4]];
         if (ODT_MAP[12*m+:4] < 4'hA) begin: gen_lt10
           for (n = 0; n < 4; n = n + 1) begin: loop_xpose
             assign phy_dout[320*ODT_MAP[(12*m+8)+:3] +
                             80*ODT_MAP[(12*m+4)+:2] +
                             8*ODT_MAP[12*m+:4] + n]
                      = mux_odt_remap[ODT_WIDTH*(n/PHASE_DIV) + m];
           end
         end else begin: gen_ge10
           for (n = 0; n < 4; n = n + 1) begin: loop_xpose
             assign phy_dout[320*ODT_MAP[(12*m+8)+:3] +
                             80*ODT_MAP[(12*m+4)+:2] +
                             8*(ODT_MAP[12*m+:4]-5) + 4 + n]
                      = mux_odt_remap[ODT_WIDTH*(n/PHASE_DIV) + m];
           end