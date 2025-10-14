always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        tx_push_r <= 'd0;
    else
        tx_push_r <= tx_push;