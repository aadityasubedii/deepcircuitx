     for (m = 0; m < CKE_WIDTH; m = m + 1) begin: gen_cke_out
       assign out_cke[m]
                = mem_dq_out[48*CKE_MAP[(12*m+8)+:3] +
                             12*CKE_MAP[(12*m+4)+:2] +
                             CKE_MAP[12*m+:4]];
       if (CKE_MAP[12*m+:4] < 4'hA) begin: gen_lt10
         for (n = 0; n < 4; n = n + 1) begin: loop_xpose
           assign phy_dout[320*CKE_MAP[(12*m+8)+:3] +
                           80*CKE_MAP[(12*m+4)+:2] +
                           8*CKE_MAP[12*m+:4] + n]
                    = mux_cke_remap[CKE_WIDTH*(n/PHASE_DIV) + m];
         end
       end else begin: gen_ge10
         for (n = 0; n < 4; n = n + 1) begin: loop_xpose
           assign phy_dout[320*CKE_MAP[(12*m+8)+:3] +
                           80*CKE_MAP[(12*m+4)+:2] +
                           8*(CKE_MAP[12*m+:4]-5) + 4 + n]
                    = mux_cke_remap[CKE_WIDTH*(n/PHASE_DIV) + m];