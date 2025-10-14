always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        begin
        txfifo_wp               <=    'd0;
        end
    else if ( !loopback && tx_push_toggle && !txfifo_full )
        begin
        tx_fifo[txfifo_wp[3:0]] <=    txd;
        txfifo_wp               <=    txfifo_wp + 1'd1;
        end
    else if ( !loopback && tx_push_toggle && txfifo_full )
        begin
        `TB_WARNING_MESSAGE
        $display("TB UART FIFO overflow");
        end
    
    else if ( loopback && rx_state == 2'd2 && rx_bit_start )
        begin
        tx_fifo[txfifo_wp[3:0]] <=    rx_byte;
        txfifo_wp               <=    txfifo_wp + 1'd1;
        end