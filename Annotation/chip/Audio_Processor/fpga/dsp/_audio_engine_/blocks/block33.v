    i2s_offset #(.WIDTH(4))
    i2s_offset_out(
        .ck(ck),
        .i2s_en(i2s_en),
        .offset(i2s_out_offset),
        .en(i2s_out_sample)
    );
