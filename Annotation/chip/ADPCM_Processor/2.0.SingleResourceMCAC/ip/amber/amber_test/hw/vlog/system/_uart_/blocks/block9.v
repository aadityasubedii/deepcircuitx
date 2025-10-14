initial
    begin
    $display("%m UART period = %f nS, want %f nS, %d, %d", 
             (TX_BITPULSE_COUNT*11 + TX_BITADJUST_COUNT) * CLK_PERIOD,
             UART_WORD_PERIOD,
             TX_BITPULSE_COUNT, TX_BITADJUST_COUNT);
    end