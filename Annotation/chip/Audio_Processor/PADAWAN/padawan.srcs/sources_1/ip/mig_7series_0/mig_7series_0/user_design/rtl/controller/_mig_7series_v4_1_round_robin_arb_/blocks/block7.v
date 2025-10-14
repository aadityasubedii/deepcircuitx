  generate
    for (i = 0; i < WIDTH; i = i + 1) begin : channel
      wire [WIDTH-1:1] inh_group;
      for (j = 0; j < (WIDTH-1); j = j + 1) begin : last_master
          assign inh_group[j+1] =
                  dbl_last_master_ns[i+j] && |dbl_req[i+WIDTH-1:i+j+1];
      end