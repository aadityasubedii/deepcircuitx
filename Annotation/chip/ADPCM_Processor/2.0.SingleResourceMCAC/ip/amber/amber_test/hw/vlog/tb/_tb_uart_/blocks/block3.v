always @( posedge clk_uart or negedge clk_uart_rst_n )
    if ( ~clk_uart_rst_n )
        tx_bit_count <= 'd0;
    else if ( tx_bit_count == 4'd9 )                
        tx_bit_count <= 'd0;
    else
        tx_bit_count <= tx_bit_count + 1'd1;
