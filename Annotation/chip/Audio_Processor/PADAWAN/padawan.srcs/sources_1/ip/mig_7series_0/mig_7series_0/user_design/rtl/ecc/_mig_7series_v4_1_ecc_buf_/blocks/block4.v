  always @(rd_data)
    for (h=0; h<2*nCK_PER_CLK; h=h+1)
      payload[h*DATA_WIDTH+:DATA_WIDTH] = 
        rd_data[h*PAYLOAD_WIDTH+:DATA_WIDTH];