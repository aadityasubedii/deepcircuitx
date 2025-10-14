    i2s_dual #(.DIVIDER(I2S_DIVIDER))
    i2s_dual(
        .ck(i2s_clock),
        .rst(wb_rst),
        .ext_sck(ext_sck),
        .ext_ws(ext_ws),
        .en(i2s_en),
        .sck(sck),
        .ws(ws),
        .frame_posn(frame_posn),
        .external(i2s_external)
    );
