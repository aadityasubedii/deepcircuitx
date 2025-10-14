      always @(act_this_rank or add_rrd_r or rst) begin
        add_rrd_ns = add_rrd_r;
        if (rst) add_rrd_ns = {ADD_RRD_CNTR_WIDTH{1'b0}};
        else
          if (act_this_rank)
            add_rrd_ns = nRRD_CLKS[0+:ADD_RRD_CNTR_WIDTH];
          else if (|add_rrd_r) add_rrd_ns =
                            add_rrd_r - {1'b1};
      end