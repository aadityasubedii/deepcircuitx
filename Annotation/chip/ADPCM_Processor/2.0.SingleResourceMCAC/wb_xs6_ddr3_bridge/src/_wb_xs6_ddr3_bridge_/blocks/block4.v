    always @( posedge i_clk )
        if ( !i_rd_empty && read_active_r )
            o_wb_dat  <= i_wb_adr[3:2] == 2'd0 ? i_rd_data[ 31: 0] :
                         i_wb_adr[3:2] == 2'd1 ? i_rd_data[ 63:32] :
                         i_wb_adr[3:2] == 2'd2 ? i_rd_data[ 95:64] :
                                                 i_rd_data[127:96] ;

end