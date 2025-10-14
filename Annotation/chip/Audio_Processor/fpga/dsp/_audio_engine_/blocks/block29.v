    reg [15:0] left_0 = 0;
    reg [15:0] right_0 = 0;
    reg [15:0] left_1 = 0;
    reg [15:0] right_1 = 0;

    i2s_tx #(.CLOCKS(I2S_BITS)) tx_0(
        .ck(ck),
        .en(i2s_out_sample),
        .frame_posn(frame_posn),
        .left(left_0),
        .right(right_0),
        .sd(sd_out0)
    );
