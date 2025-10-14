  always @(ras_timer_ns_in or rb_hit_busies_r) begin
    passed_ras_timer = {RAS_TIMER_WIDTH{1'b0}};
    for (i=ID+1; i<(ID+nBANK_MACHS); i=i+1)
      if (rb_hit_busies_r[i])
        passed_ras_timer = ras_timer_ns_in[i*RAS_TIMER_WIDTH+:RAS_TIMER_WIDTH];
  end