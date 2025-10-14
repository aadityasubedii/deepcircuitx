      always @(req_rank_r or req_rank_r_in or start_rcd_in) begin
        inhbt_act_rrd = 1'b0;
        for (j=(ID+1); j<(ID+nBANK_MACHS); j=j+1)
          inhbt_act_rrd = inhbt_act_rrd || start_rcd_in[j];
      end