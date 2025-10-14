alt_vipcti131_common_frame_counter divider_counter(
    .rst(rst),
    .clk(clk),
    .sclr(sclr),
    
    .enable(count_div),
    .hd_sdn(hd_sdn),
    
    .h_total(divider_value),
    .v_total(13'd0),
    
    .h_reset(14'd0),
    .v_reset(13'd0),
    
    .new_line(div_next));