assign tag_address      = read_miss_fill     ? miss_address      [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_INIT] ? init_count[CACHE_ADDR_WIDTH-1:0]                      :
                                               address                                               ;