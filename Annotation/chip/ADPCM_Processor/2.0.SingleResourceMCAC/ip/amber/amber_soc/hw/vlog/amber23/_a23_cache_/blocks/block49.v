assign data_address     = write_hit          ? i_address   [CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] :
                          source_sel[C_FILL] ? miss_address[CACHE_ADDR32_MSB:CACHE_ADDR32_LSB] : 
                          source_sel[C_CORE] ? address                                         :
                                               {CACHE_ADDR_WIDTH{1'd0}}                        ;