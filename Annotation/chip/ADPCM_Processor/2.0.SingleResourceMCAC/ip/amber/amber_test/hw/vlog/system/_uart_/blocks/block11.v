initial
    begin
    if ((( TX_BITPULSE_COUNT * CLK_PERIOD ) > (UART_BIT_PERIOD * 1.03) ) ||
        (( TX_BITPULSE_COUNT * CLK_PERIOD ) < (UART_BIT_PERIOD * 0.97) ) )
        begin
        `TB_ERROR_MESSAGE
        $display("UART TX bit period, %.1f, is too big. UART will not work!", TX_BITPULSE_COUNT * CLK_PERIOD);
        $display("Baud rate is %f, and baud bit period is %.1f", UART_BAUD, UART_BIT_PERIOD);
        $display("Either reduce the baud rate, or increase the system clock frequency");
        $display("------");
        end
    end