  always @(act_wait_r or req_rank_r) begin
    act_this_rank_ns = {RANKS{1'b0}};
    for (i = 0; i < RANKS; i = i + 1)
      act_this_rank_ns[i] = act_wait_r && (i[RANK_WIDTH-1:0] == req_rank_r);
  end