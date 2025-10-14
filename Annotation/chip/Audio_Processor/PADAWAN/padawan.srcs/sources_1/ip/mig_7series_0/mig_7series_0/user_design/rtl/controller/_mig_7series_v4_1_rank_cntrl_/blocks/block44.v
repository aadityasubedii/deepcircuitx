  always @(act_this_rank_r or sending_row) begin
    
    act_this_rank = 1'b0;
    
    for (i = 0; i < nBANK_MACHS; i = i + 1)
      act_this_rank =
         act_this_rank || (sending_row[i] && act_this_rank_r[(i*RANKS)+ID]);
  
  end