assign read_miss_wdata  = miss_address[3:2] == 2'd0 ? wb_rdata_burst                              :
                          miss_address[3:2] == 2'd1 ? { wb_rdata_burst[95:0], wb_rdata_burst[127:96] }:
                          miss_address[3:2] == 2'd2 ? { wb_rdata_burst[63:0], wb_rdata_burst[127:64] }:
                                                      { wb_rdata_burst[31:0], wb_rdata_burst[127:32] };