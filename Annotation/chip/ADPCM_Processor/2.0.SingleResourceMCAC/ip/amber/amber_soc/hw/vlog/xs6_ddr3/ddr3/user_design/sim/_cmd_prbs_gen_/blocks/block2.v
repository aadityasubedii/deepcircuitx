    always @ (lfsr_q[SEED_WIDTH - 1:1], ZEROS) begin
        prbs = {ZEROS[SEED_WIDTH - 1:7],lfsr_q[6:1]};
    end