  generate
    if (nBANK_MACHS >1) multiple_demand_priority:
         cover property (@(posedge clk)
           ($countones(demand_priority_in[`BM_SHARED_BV]) > 1));
  endgenerate