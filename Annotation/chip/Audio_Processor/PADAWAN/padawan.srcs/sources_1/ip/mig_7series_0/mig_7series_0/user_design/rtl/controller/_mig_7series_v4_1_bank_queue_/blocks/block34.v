  always @(accept_this_bm or clear_req or idle_r_lcl) begin
    idle_ns_lcl = idle_r_lcl;
    if (accept_this_bm) idle_ns_lcl = 1'b0;
    if (clear_req) idle_ns_lcl = 1'b1;
  end