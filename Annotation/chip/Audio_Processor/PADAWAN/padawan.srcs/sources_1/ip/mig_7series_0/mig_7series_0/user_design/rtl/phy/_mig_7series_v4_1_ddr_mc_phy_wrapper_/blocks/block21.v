        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*BANK_MAP[(12*m+8)+:3] +
                          80*BANK_MAP[(12*m+4)+:2] +
                          8*(BANK_MAP[12*m+:4]-5) + 4 + n]
                   = mux_bank[BANK_WIDTH*(n/PHASE_DIV) + m];
        end
      end