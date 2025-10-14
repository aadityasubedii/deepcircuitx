always @( posedge i_clk )
    uart0_cts_n_d <= {uart0_cts_n_d[2:0], i_uart_cts_n};
                                            