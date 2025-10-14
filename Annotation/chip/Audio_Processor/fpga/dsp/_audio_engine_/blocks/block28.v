    i2s_tx #(.CLOCKS(I2S_BITS)) tx_1(
        .ck(ck),
        .en(i2s_out_sample),
        .frame_posn(frame_posn),
        .left(left_1),
        .right(right_1),
        .sd(sd_out1)
    );
