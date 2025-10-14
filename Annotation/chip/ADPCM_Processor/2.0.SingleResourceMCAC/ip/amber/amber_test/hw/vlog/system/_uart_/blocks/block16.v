always @( posedge i_clk )
    rxd_d[4:0] <= {rxd_d[3:0], i_uart_rxd};
