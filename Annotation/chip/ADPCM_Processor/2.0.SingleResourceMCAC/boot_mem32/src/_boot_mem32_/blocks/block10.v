    always @( posedge i_wb_clk )
        jitter_r <= {jitter_r[6:0], jitter_r[7] ^ jitter_r[4] ^ jitter_r[1]};
        