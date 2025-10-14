      always @(rank_busy_r) begin
        my_rank_busy = 1'b0;
        for (i=0; i < nBANK_MACHS; i=i+1)
          my_rank_busy = my_rank_busy || rank_busy_r[(i*RANKS)+ID];
      end