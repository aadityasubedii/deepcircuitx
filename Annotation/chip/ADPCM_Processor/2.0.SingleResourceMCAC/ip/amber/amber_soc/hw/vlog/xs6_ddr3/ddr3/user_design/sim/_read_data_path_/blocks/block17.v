 always @ (posedge clk_i)
       cmp_data_en <= #TCQ data_rdy;
