   generate
     for (wr_i = 0; wr_i < DQS_WIDTH; wr_i = wr_i +1) begin: gen_final_tap
      always @(posedge clk) begin