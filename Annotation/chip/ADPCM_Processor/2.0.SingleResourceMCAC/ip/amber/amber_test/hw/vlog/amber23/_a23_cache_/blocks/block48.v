assign tag_address      = source_sel[C_FILL] ? miss_address      [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_INVA] ? ex_read_address                                       :
                          source_sel[C_INIT] ? init_count[CACHE_ADDR_WIDTH-1:0]                      :
                          source_sel[C_CORE] ? address                                               :
                                               {CACHE_ADDR_WIDTH{1'd0}}                              ;