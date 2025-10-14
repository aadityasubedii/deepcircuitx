 always @ (posedge clk_i)
                  
                  
                  
     buf_avail_r <= #TCQ 64 - (rd_data_counts_asked - rd_data_received_counts);
 
 
   