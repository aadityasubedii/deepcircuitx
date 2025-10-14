    `ifdef MAKE_HIFI
        localparam I2S_BITS = 32;
    `endif
    `ifdef MAKE_DSP
        localparam I2S_BITS = 64;
    `endif
