  generate

    if((nCK_PER_CLK == 4) && (ADDR_CMD_MODE != "2T"))
      assign rts_row = ~sending_row && row_demand_ok &&
                      (act_req && ~my_inhbt_act_faw && ~inhbt_act_rrd);
    else
      assign rts_row = ~sending_row && row_demand_ok &&
                      ((act_req && ~my_inhbt_act_faw && ~inhbt_act_rrd) ||
                        pre_request);
  endgenerate