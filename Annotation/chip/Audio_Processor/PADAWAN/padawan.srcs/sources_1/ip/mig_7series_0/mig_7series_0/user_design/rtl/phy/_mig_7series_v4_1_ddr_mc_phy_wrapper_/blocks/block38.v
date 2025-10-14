  generate
    genvar i, j;
    for (i = 0; i < DQ_WIDTH; i = i + 1) begin: gen_loop_rd_data_1
      for (j = 0; j < PHASE_PER_CLK; j = j + 1) begin: gen_loop_rd_data_2
        assign rd_data[DQ_WIDTH*j + i]
                 = phy_din[(320*FULL_DATA_MAP[(12*i+8)+:3]+
                            80*FULL_DATA_MAP[(12*i+4)+:2] +
                            8*FULL_DATA_MAP[12*i+:4]) + j];
      end
    end
  endgenerate