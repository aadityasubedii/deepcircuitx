always @ ( posedge i_clk )
    if ( ex_read_hit_clear )
        begin
        ex_read_hit_r   <= 1'd0;
        ex_read_hit_way <= 'd0;
        end
    else if ( ex_read_hit )
        begin
        
        `ifdef A25_CACHE_DEBUG
            `TB_DEBUG_MESSAGE
            $display ("Exclusive access cache hit address 0x%08h", i_address);
        `endif
        
        ex_read_hit_r   <= 1'd1;
        ex_read_hit_way <= data_hit_way;
        end