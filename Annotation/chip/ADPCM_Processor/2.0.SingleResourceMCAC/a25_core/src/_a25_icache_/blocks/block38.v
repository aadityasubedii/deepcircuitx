assign data_address     = read_miss_fill     ? miss_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] : 
                                               address                                         ;