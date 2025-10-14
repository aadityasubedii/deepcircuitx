    assign sck          = external ? ext_sck        : local_sck;
    assign ws           = external ? ext_ws         : local_ws;
    assign en           = external ? ext_en         : local_en;
    assign frame_posn   = external ? ext_frame_posn : local_frame_posn;