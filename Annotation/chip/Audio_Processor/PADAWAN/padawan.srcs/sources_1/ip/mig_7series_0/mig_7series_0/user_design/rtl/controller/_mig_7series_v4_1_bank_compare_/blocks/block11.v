  assign rb_hit_busy_ns_lcl = rank_bank_hit && ~idle_ns;
  output wire  rb_hit_busy_ns;
  assign rb_hit_busy_ns = rb_hit_busy_ns_lcl;