always @ ( posedge i_clk )
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_UART_ICR )
            ;
    else if ( fifo_enable ) 
        begin
        if (tx_interrupt == 1'd0 && tx_fifo_half_or_less_full && uart_cr_reg[5])
            $display("%m: tx_interrupt Interrupt Set with FIFO enabled");
        if (tx_interrupt == 1'd1 && !(tx_fifo_half_or_less_full && uart_cr_reg[5]))
            $display("%m: tx_interrupt Interrupt Cleared with FIFO enabled");
        end
    else
        begin
        if (tx_interrupt == 1'd0 && tx_fifo_empty && uart_cr_reg[5])
            $display("%m: tx_interrupt Interrupt Set with FIFO disabled");
        if (tx_interrupt == 1'd1 && !(tx_fifo_empty && uart_cr_reg[5]))
            $display("%m: tx_interrupt Interrupt Cleared with FIFO disabled");
        end