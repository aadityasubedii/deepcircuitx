      always @(sending_col or wr_this_rank_r) begin
        write_this_rank = 1'b0;
        for (i = 0; i < nBANK_MACHS; i = i + 1)
        write_this_rank =
           write_this_rank || (sending_col[i] && wr_this_rank_r[(i*RANKS)+ID]);
      end