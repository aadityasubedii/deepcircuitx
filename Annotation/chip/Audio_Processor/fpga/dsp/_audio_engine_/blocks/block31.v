    i2s_rx #(.BITS(MIC_W), .CLOCKS(I2S_BITS)) 
    rx_0(.ck(ck), .sample(i2s_in_sample), 
            .frame_posn(frame_posn), .sd(sd_in0), .left(mic_0), .right(mic_1));
    i2s_rx #(.BITS(MIC_W), .CLOCKS(I2S_BITS))