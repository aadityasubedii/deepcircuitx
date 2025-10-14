generate
if ( WAYS == 2 ) begin : read_data_2ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           
end
else if ( WAYS == 3 ) begin : read_data_3ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                          data_hit_way[2] ? data_rdata_way[2] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           
end
else if ( WAYS == 4 ) begin : read_data_4ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                          data_hit_way[2] ? data_rdata_way[2] :
                          data_hit_way[3] ? data_rdata_way[3] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           
end
else begin : read_data_8ways

    assign hit_rdata    = data_hit_way[0] ? data_rdata_way[0] :
                          data_hit_way[1] ? data_rdata_way[1] :
                          data_hit_way[2] ? data_rdata_way[2] :
                          data_hit_way[3] ? data_rdata_way[3] :
                          data_hit_way[4] ? data_rdata_way[4] :
                          data_hit_way[5] ? data_rdata_way[5] :
                          data_hit_way[6] ? data_rdata_way[6] :
                          data_hit_way[7] ? data_rdata_way[7] :
                                     {CACHE_LINE_WIDTH{1'd1}} ;  
                           
end