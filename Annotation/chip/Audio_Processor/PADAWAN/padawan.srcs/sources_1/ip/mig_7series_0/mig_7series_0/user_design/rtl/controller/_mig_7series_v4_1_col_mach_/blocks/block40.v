      always @(posedge clk) offset_r1 <=
                              #TCQ offset_r[DATA_BUF_OFFSET_WIDTH-1:0];