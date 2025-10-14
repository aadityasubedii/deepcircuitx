    for (i=0;i<16;i=i+1) begin : masked
        assign masked_wdata[8*i+7:8*i] = wr_mask[i] ? rd_data[8*i+7:8*i] : wr_data[8*i+7:8*i];
        end