
    wire baud_en;

    localparam BAUD = CK_HZ / 115200;
    uart_baud #(.DIVIDE(BAUD)) uart_clock (.ck(wb_clk), .baud_ck(baud_en));