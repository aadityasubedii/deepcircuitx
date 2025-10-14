always @( posedge i_clk )
    begin      
    
    if ( fifo_enable )
        begin
        
        if ( tx_fifo_push_not_full )
            begin
            tx_fifo[tx_fifo_wp[3:0]] <= wb_wdata32[7:0];
            tx_fifo_wp <= tx_fifo_wp + 1'd1;
            end
        
            
        
        if ( tx_fifo_pop_not_empty )
            tx_fifo_rp <= tx_fifo_rp + 1'd1;
            
        
        if (tx_fifo_push_not_full && !tx_fifo_pop_not_empty)
            tx_fifo_count <= tx_fifo_count + 1'd1;
            
        
        else if (tx_fifo_pop_not_empty  && !tx_fifo_push_not_full)
            tx_fifo_count <= tx_fifo_count - 1'd1;
        end
        
    
    else  
        begin
        
        tx_fifo_wp    <= 'd0;
        tx_fifo_rp    <= 'd0;
        tx_fifo_count <= 'd0;
        
        
        if ( tx_fifo_push_not_full )
            begin
            tx_fifo[0]          <= wb_wdata32[7:0];
            tx_fifo_full_flag   <= 1'd1;
            end
        
        else if ( tx_fifo_pop_not_empty )
            tx_fifo_full_flag   <= 1'd0;

        end        
    end