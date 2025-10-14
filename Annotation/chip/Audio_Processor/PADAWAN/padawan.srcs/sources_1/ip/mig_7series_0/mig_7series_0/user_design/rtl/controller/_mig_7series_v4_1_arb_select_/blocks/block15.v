  always @(grant_config_r
           or rnk_config_r or rnk_config_strobe or req_rank_r or rst) begin
    if (rst) rnk_config_ns = {RANK_WIDTH{1'b0}};
    else begin
      rnk_config_ns = rnk_config_r;
      if (rnk_config_strobe)
        for (i=0; i<nBANK_MACHS; i=i+1)
          if (grant_config_r[i]) rnk_config_ns = req_rank_r[(RANK_WIDTH*i)+:RANK_WIDTH];
    end
  end