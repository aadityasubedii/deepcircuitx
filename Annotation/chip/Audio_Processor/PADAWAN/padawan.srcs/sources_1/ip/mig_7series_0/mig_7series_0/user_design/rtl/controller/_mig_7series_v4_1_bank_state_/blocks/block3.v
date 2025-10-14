  always @(rd_wr_r or req_rank_r) begin
    wr_this_rank_ns = {RANKS{1'b0}};
    rd_this_rank_ns = {RANKS{1'b0}};
    for (i=0; i<RANKS; i=i+1) begin
      wr_this_rank_ns[i] = ~rd_wr_r && (i[RANK_WIDTH-1:0] == req_rank_r);
      rd_this_rank_ns[i] = rd_wr_r && (i[RANK_WIDTH-1:0] == req_rank_r);
    end
  end