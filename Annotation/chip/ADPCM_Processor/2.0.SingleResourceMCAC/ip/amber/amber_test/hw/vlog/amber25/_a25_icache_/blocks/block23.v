generate
if ( WAYS == 2 ) begin : read_data_2ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           
end