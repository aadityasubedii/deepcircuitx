always @( posedge i_clk )
    begin
    if ( read_ack_r )
        read_ready <= 1'd1;
    else if ( read_request )
        read_ready <= 1'd0;
    
    if ( !i_cmd_full )
        begin
        write_request_r  <= write_request;
        read_request_r   <= read_request;
        wb_adr_r         <= i_mem_ctrl ? {5'd0, i_wb_adr[24:0]} : i_wb_adr[29:0];
        end
        
    if ( read_request  )
        read_active_r <= 1'd1;
    else if ( read_ack_r )
        read_active_r <= 1'd0;
    
    if ( i_rd_empty == 1'd0 && read_active_r )
        read_ack_r  <= 1'd1;
    else
        read_ack_r  <= 1'd0;
    end