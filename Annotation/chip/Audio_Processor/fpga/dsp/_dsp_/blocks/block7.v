    ibus ibus (
        .wb_clk(ck),
        .wb_rst(rst),
        
        .wb_ibus_adr(s_adr),
        .wb_ibus_rdt(s_rdt),
        .wb_ibus_cyc(s_cyc),
        .wb_ibus_ack(s_ack),
        
        .spi_cs(spi_cs),
        .spi_sck(spi_sck),
        .spi_miso(spi_miso),
        .spi_mosi(spi_mosi),
        .ready(ibus_ready)
    );