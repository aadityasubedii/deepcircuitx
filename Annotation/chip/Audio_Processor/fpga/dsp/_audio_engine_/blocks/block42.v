
    reg [FRAME_W-1:0] control_reg_frame = 0;
    reg allow_audio_writes = 0;

    assign frame = allow_audio_writes ? control_reg_frame : frame_counter;
