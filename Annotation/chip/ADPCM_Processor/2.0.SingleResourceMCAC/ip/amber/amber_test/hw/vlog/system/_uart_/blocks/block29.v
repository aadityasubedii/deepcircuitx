always @ ( posedge i_clk )
    begin 
    
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_UART_ICR )
        tx_interrupt <= 1'd0;

    
    else if  ( fifo_enable ) 
        
        
        tx_interrupt <= tx_fifo_half_or_less_full && uart_cr_reg[5];
    else 
        
        
        tx_interrupt <= tx_fifo_empty && uart_cr_reg[5];
    end