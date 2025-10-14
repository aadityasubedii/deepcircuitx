      always @(posedge clk) offset_r2 <=
                              #TCQ offset_r1[DATA_BUF_OFFSET_WIDTH-1:0];