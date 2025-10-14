  generate 
    genvar pb_i;
    if (nCK_PER_CLK == 4) begin: cmp_err_pb_4to1
      for(pb_i=0 ; pb_i<DRAM_WIDTH; pb_i=pb_i+1) begin
        always @ (posedge clk) begin