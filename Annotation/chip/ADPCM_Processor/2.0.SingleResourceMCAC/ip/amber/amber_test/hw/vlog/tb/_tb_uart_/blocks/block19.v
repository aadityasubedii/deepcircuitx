initial
    begin
    clk_uart        = 1'd0;
    forever #(UART_BIT_PERIOD*100/2) clk_uart = ~clk_uart;
    end