   always @(*) begin
     for (v = 0; v < DQS_WIDTH; v = v + 1)
       corse_cnt_dbg[3*v+:3] = corse_cnt[v];
   end
  