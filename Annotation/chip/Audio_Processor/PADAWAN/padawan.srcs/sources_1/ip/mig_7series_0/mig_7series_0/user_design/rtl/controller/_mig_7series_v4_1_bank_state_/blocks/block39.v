  generate
    integer j;
    if (RANKS == 1)
      always @(req_rank_r or req_rank_r_in or start_rcd_in) begin
        inhbt_act_rrd = 1'b0;