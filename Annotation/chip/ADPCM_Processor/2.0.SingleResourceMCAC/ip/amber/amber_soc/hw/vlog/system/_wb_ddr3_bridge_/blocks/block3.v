always @( posedge i_clk )
    begin
    if ( read_ack )
        read_ready <= 1'd1;
    else if ( start_read )
        read_ready <= 1'd0;
    
    start_write_d1  <= start_write;
    start_read_d1   <= start_read;
    wb_adr_d1       <= i_wb_adr;
    
    if ( start_read  )
        start_read_hold <= 1'd1;
    else if ( read_ack )
        start_read_hold <= 1'd0;
    
    if ( i_rd_empty == 1'd0 && start_read_hold )
        begin
        `ifdef XILINX_VIRTEX6_FPGA
            o_wb_dat  <= i_wb_adr[2] == 2'd2   ? i_rd_data[  31:0] :
                                                 i_rd_data[ 63:32] ;
        `else
            o_wb_dat  <= i_wb_adr[3:2] == 2'd0 ? i_rd_data[ 31: 0] :
                         i_wb_adr[3:2] == 2'd1 ? i_rd_data[ 63:32] :
                         i_wb_adr[3:2] == 2'd2 ? i_rd_data[ 95:64] :
                                                 i_rd_data[127:96] ;
        `endif
        read_ack  <= 1'd1;
        end
    else
        read_ack  <= 1'd0;
    end