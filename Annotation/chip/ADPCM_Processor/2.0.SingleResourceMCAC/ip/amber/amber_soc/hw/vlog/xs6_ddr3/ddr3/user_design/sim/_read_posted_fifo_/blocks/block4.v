   always @(gen_rdy_i, empty,empty_r,rd_mdata_fifo_empty,rd_first_data ,data_valid_i,data_valid_r,user_bl_cnt_not_1)
   begin
        if (FAMILY == "SPARTAN6")
            rd_en = gen_rdy_i & !empty;
        else 
             if ( MEM_BURST_LEN == 4)
                   rd_en = (~empty & empty_r & ~rd_first_data) | (~rd_mdata_fifo_empty & ~empty ) | (user_bl_cnt_not_1 & data_valid_i);
             else
                   rd_en = (data_valid_i & ~data_valid_r) | (user_bl_cnt_not_1 & data_valid_i);
   
        end