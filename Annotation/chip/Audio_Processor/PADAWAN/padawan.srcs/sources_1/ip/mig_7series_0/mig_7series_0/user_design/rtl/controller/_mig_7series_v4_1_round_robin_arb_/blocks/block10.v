  always @(last_master_ns)
    dbl_last_master_ns = {last_master_ns, last_master_ns};
  reg [WIDTH*2-1:0] dbl_req;