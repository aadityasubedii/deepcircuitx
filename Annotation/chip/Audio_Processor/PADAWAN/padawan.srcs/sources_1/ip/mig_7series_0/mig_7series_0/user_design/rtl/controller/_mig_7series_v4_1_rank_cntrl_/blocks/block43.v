  generate
    if (nADD_RRD > 0 && ADD_RRD_CNTR_WIDTH > 1) begin :add_rdd1
      reg[ADD_RRD_CNTR_WIDTH-1:0] add_rrd_ns;
      reg[ADD_RRD_CNTR_WIDTH-1:0] add_rrd_r;