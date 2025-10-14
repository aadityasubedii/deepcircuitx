  generate
    for (h=0; h<2*nCK_PER_CLK; h=h+1) begin : merge_data_outer
      for (i=0; i<DATA_WIDTH/8; i=i+1) begin : merge_data_inner
        assign merged_data[h*PAYLOAD_WIDTH+i*8+:8] =  
                wr_data_mask[h*DATA_WIDTH/8+i]
                  ? rd_merge_data[h*DATA_WIDTH+i*8+:8]               
                  : wr_data[h*PAYLOAD_WIDTH+i*8+:8];
      end
      if (PAYLOAD_WIDTH > DATA_WIDTH)
        assign merged_data[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH]=
                      wr_data[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH];
                                                                   
    end
  endgenerate