initial
    begin
    
    clk_uart_rst_n  = 1'd0;
    
    #(UART_BIT_PERIOD*1000) clk_uart_rst_n  = 1'd1;
    end