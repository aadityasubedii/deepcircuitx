    always @(posedge bclk)begin
        wc_ff <= {wc_ff[0], wclk};
    end