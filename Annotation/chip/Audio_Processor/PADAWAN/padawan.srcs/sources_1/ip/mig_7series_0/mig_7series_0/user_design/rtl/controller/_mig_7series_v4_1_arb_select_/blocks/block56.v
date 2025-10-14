  generate
    begin : row_mux
      wire [OUT_CMD_WIDTH-1:0] maint_cmd =
                     {maint_rank_r,                     
                      row_cmd_r[15+:(BANK_WIDTH+ROW_WIDTH-11)],
                                              
                      1'b0,                            
                      row_cmd_r[3+:10],                
                      
                      (maint_zq_r ? 3'b110 : maint_srx_r ? 3'b111 : 3'b001)
                     };