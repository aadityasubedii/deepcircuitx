        assign merged_data[h*PAYLOAD_WIDTH+i*8+:8] =  
                wr_data_mask[h*DATA_WIDTH/8+i]
                  ? rd_merge_data[h*DATA_WIDTH+i*8+:8]               
                  : wr_data[h*PAYLOAD_WIDTH+i*8+:8];