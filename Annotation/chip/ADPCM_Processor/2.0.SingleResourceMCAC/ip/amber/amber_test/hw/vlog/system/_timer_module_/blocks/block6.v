generate
if (WB_DWIDTH == 128) 
    begin : wb128
    assign wb_wdata32   = i_wb_adr[3:2] == 2'd3 ? i_wb_dat[127:96] :
                          i_wb_adr[3:2] == 2'd2 ? i_wb_dat[ 95:64] :
                          i_wb_adr[3:2] == 2'd1 ? i_wb_dat[ 63:32] :
                                                  i_wb_dat[ 31: 0] ;
                                                                                                                                            
    assign o_wb_dat    = {4{wb_rdata32}};
    end
else
    begin : wb32
    assign wb_wdata32  = i_wb_dat;
    assign o_wb_dat    = wb_rdata32;
    end
endgenerate