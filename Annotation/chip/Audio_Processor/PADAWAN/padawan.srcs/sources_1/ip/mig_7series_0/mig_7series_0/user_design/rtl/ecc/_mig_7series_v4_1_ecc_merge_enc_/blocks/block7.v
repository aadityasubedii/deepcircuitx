        assign merged_data[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH]=
                      wr_data[(h+1)*PAYLOAD_WIDTH-1-:PAYLOAD_WIDTH-DATA_WIDTH];