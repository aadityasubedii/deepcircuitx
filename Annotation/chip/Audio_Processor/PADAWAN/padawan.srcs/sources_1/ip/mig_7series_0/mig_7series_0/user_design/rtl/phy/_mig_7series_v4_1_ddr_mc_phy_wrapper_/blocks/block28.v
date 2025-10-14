  generate
    if (REG_CTRL == "ON") begin: gen_parity_out
      
      assign out_parity
        = mem_dq_out[48*PARITY_MAP[10:8] + 12*PARITY_MAP[5:4] +
                     PARITY_MAP[3:0]];
      if (PARITY_MAP[3:0] < 4'hA) begin: gen_lt10
        assign phy_dout[(320*PARITY_MAP[10:8] + 80*PARITY_MAP[5:4] +
                         8*PARITY_MAP[3:0])+:4]
                 = {parity_in[3/PHASE_DIV], parity_in[2/PHASE_DIV],
                    parity_in[1/PHASE_DIV], parity_in[0]};
      end else begin: gen_ge10
        assign phy_dout[(320*PARITY_MAP[10:8] + 80*PARITY_MAP[5:4] +
                         8*(PARITY_MAP[3:0]-5) + 4)+:4]
               = {parity_in[3/PHASE_DIV], parity_in[2/PHASE_DIV],
                  parity_in[1/PHASE_DIV], parity_in[0]};
      end
    end
  endgenerate