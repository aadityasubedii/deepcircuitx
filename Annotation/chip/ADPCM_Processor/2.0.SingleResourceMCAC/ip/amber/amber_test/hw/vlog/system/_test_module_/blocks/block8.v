always @( posedge i_clk )
    begin
    if ( wb_start_write && i_wb_adr[15:8] == AMBER_TEST_RANDOM_NUM[15:8] )
        random_num <= wb_wdata32[7:0];
        
    
    else if ( wb_start_read && i_wb_adr[15:8] == AMBER_TEST_RANDOM_NUM[15:8] )
        random_num <= { random_num[3]^random_num[1], 
                        random_num[0]^random_num[5], 
                        ~random_num[7]^random_num[4], 
                        ~random_num[2],
                        random_num[6],
                        random_num[4]^~random_num[3],
                        random_num[7]^~random_num[1],
                        random_num[7]                     
                      };
    end    