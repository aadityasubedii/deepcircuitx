alt_vipcti131_common_frame_counter frame_counter(
    .rst(rst),
    .clk(clk),
    .sclr(start_of_vsync_f0),
    
    .enable(count),
    .hd_sdn(hd_sdn),
    
    .h_total(total_sample_count),
    .v_total(total_line_count),
    
    .h_reset(14'd0),
    .v_reset(13'd0),
    
    .sample_ticks(sample_ticks),
    .h_count(h_count),
    .v_count(v_count));