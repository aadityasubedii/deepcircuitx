always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        rx_bit_count <= 'd0;
    else if ( rx_bit_count == 4'd9 )                
        rx_bit_count <= 'd0;
    
    else if ( rx_start_negedge )                
        rx_bit_count <= 'd0;
    else
        rx_bit_count <= rx_bit_count + 1'd1;