    wire start_of_frame;
    assign start_of_frame = ws & (frame_posn == 0);