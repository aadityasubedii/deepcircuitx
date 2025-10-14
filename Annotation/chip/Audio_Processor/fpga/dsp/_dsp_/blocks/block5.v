`ifdef USE_AUDIO_ENGINE

    wire engine_ack;
    wire [31:0] engine_rdt;

    
    wire audio_ready;
    
    wire dma_done;
    wire dma_match;

    assign o_sck = sck;
    assign o_ws = ws;
    assign ext_sd = o_sd0;

    audio_engine #(.CK_HZ(CK_HZ)) audio_engine(
        .ck(ck),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_sel(wb_dbus_sel),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .ack(engine_ack),
        .rdt(engine_rdt),

        .dma_cyc(dma_cyc),
        .dma_we(dma_we),
        .dma_sel(dma_sel),
        .dma_adr(dma_adr),
        .dma_dat(dma_dat),
        .dma_ack(dma_ack),
        .dma_rdt(dma_rdt),
        .dma_done(dma_done),
        .dma_match(dma_match),

        .sck(sck),