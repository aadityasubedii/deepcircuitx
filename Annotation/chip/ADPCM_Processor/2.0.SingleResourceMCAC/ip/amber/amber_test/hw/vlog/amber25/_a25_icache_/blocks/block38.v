assign tag_wdata        = read_miss_fill     ? {1'd1, miss_address[31:TAG_ADDR32_LSB]} :
                                               {TAG_WIDTH{1'd0}}                       ;