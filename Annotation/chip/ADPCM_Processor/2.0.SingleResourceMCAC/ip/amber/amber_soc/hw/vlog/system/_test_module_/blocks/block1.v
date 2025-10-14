always @( posedge i_clk )
    begin
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_UART_CONTROL )
        tb_uart_control_reg <= wb_wdata32[1:0];  
        
    if ( wb_start_write && i_wb_adr[15:0] == AMBER_TEST_UART_TXD )
        begin
        tb_uart_txd_reg   <= wb_wdata32[7:0];
        tb_uart_push      <= !tb_uart_push;
        end
    end