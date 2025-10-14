always @ ( posedge i_clk )
    begin
    if ( c_state == CS_FILL1 || c_state == CS_FILL2 || 
         c_state == CS_FILL3 || c_state == CS_FILL4 )
        begin
        if ( !i_wb_stall )
            begin
            wb_read_buf_valid   <= 1'd1;
            wb_read_buf_address <= i_wb_address;
            wb_read_buf_data    <= i_wb_read_data;
            end
        end
    else    
        wb_read_buf_valid   <= 1'd0;
    end