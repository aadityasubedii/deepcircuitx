`ifdef USE_DMA

    localparam XFER_ADDR_W = 3;
    localparam XFER_DATA_W = 16;

    wire [31:0] dma_dbus_rdt;
    wire dma_dbus_ack;
    wire xfer_done;
    wire [XFER_ADDR_W-1:0] xfer_adr;
    
    wire block_done;
    wire xfer_re;
    
    wire xfer_match;

    assign dma_done = xfer_done;
    assign dma_match = xfer_match;

    wire [15:0] xfer_dat;
    assign xfer_dat = mic_source(xfer_adr);

    wire xfer_block;
    assign xfer_block = start_of_frame; 

    dma #(.ADDR(ADDR_DMA), .WIDTH(8), .XFER_ADDR_W(XFER_ADDR_W))
    dma (
        .wb_clk(ck),
        .wb_rst(wb_rst),
        .wb_dbus_cyc(wb_dbus_cyc),
        .wb_dbus_we(wb_dbus_we),
        .wb_dbus_adr(wb_dbus_adr),
        .wb_dbus_dat(wb_dbus_dat),
        .dbus_rdt(dma_dbus_rdt),
        .dbus_ack(dma_dbus_ack),
        .xfer_block(xfer_block),
        .block_done(block_done),
        .xfer_done(xfer_done),
        .xfer_match(xfer_match),
        .xfer_adr(xfer_adr),
        .xfer_re(xfer_re),
        .xfer_dat(xfer_dat),
        .dma_cyc(dma_cyc),
        .dma_we(dma_we),
        .dma_sel(dma_sel),
        .dma_adr(dma_adr),
        .dma_dat(dma_dat),
        .dma_ack(dma_ack),
        .dma_rdt(dma_rdt)
    );
`else   
