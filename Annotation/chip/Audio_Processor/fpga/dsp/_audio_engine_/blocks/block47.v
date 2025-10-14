    localparam CHANNELS = 8;
    localparam FRAMES = 256;

    localparam CODE = 256; 
    localparam CODE_W = $clog2(CODE);
    localparam COEF_W = CODE_W + 1; 

    localparam CHAN_W = $clog2(CHANNELS);
    localparam FRAME_W = $clog2(FRAMES);
    localparam AUDIO = CHANNELS * FRAMES;
    localparam AUDIO_W = $clog2(AUDIO);