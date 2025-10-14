else if ( WAYS == 4 ) begin : read_data_4ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                          data_hit_way[2] ? data_rdata_way[2] :
                          data_hit_way[3] ? data_rdata_way[3] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           