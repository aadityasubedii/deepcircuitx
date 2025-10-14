generate
  for(rd_i = 0; rd_i < DQS_WIDTH; rd_i = rd_i +1)begin: gen_rd
   always @(posedge clk)
     rd_data_rise_wl_r[rd_i] <=