      always @(sending_col or rd_this_rank_r) begin
        read_this_rank = 1'b0;
        for (i = 0; i < nBANK_MACHS; i = i + 1)
        read_this_rank =
           read_this_rank || (sending_col[i] && rd_this_rank_r[(i*RANKS)+ID]);
      end