always @( posedge i_clk )
    if ( i_cmd_full && write_request )
        begin
        write_buf_r     <= 1'd1;
        wb_sel_buf_r    <= i_wb_sel;
        wb_dat_buf_r    <= i_wb_dat;
        wb_adr_buf_r    <= i_wb_adr;
        end