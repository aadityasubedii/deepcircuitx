generate begin : sync_to_generate
    if(SYNC_TO == 0) begin
        assign frame_synch = end_of_vsync & ~f;
    end else if(SYNC_TO == 1) begin
        assign frame_synch = end_of_vsync & f;
    end else begin
        assign frame_synch = end_of_vsync;
    end
end endgenerate