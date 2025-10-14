        .sd_in0(sd_in0),
        .sd_in1(sd_in1),
        .sd_in2(sd_in2),
        .sd_in3(sd_in3),

        .ext_sck(ext_sck),
        .ext_ws(ext_ws),

        .ready(audio_ready),
        .test(test)
    );

`else

    wire dma_match;
    wire dma_done;
    wire engine_ack;
    wire [31:0] engine_rdt;

    assign engine_ack = 0;
    assign engine_rdt = 0;
    assign dma_done = 0;
    assign dma_match = 0;

    
    assign test = 0;
    assign sck = 0;
    assign ws = 0;
    assign o_sck = 0;
    assign o_ws = 0;
    assign o_sd = 0;
    assign ext_sd = 0;