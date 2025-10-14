    i2s_rx #(.BITS(MIC_W), .CLOCKS(I2S_BITS))
    rx_1(.ck(ck), .sample(i2s_in_sample), 
            .frame_posn(frame_posn), .sd(sd_in1), .left(mic_2), .right(mic_3));
    i2s_rx #(.BITS(MIC_W), .CLOCKS(I2S_BITS))
    rx_2(.ck(ck), .sample(i2s_in_sample), 
            .frame_posn(frame_posn), .sd(sd_in2), .left(mic_4), .right(mic_5));
    i2s_rx #(.BITS(MIC_W), .CLOCKS(I2S_BITS))
    rx_3(.ck(ck), .sample(i2s_in_sample), 
            .frame_posn(frame_posn), .sd(sd_in3), .left(mic_6), .right(mic_7));
