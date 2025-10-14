alt_vipcti130_Vid2IS_control control(
    .rst(rst),
    .clk(is_clk),

    
    .usedw(usedw),
    .overflow_sticky(overflow_sticky_sync1),
    .is_output_enable(is_output_enable), 
    
    
    .update(update_sync1),
    .resolution_change(resolution_change_sync1),
    .interlaced(interlaced),
    .active_sample_count(active_sample_count),
    .active_line_count_f0(active_line_count_f0),
    .active_line_count_f1(active_line_count_f1),
    .total_sample_count(total_sample_count),
    .total_line_count_f0(total_line_count_f0),
    .total_line_count_f1(total_line_count_f1),
    .stable(stable),
    .resolution_valid(resolution_valid),
    .vid_std(vid_std_sync1), 
    
    
    .enable(enable),
    .clear_overflow_sticky(clear_overflow_sticky),
    .is_interlaced(is_interlaced),
    .is_active_sample_count(is_active_sample_count),
    .is_active_line_count_f0(is_active_line_count_f0),
    .is_active_line_count_f1(is_active_line_count_f1),
    .sof_sample(sof_sample),
    .sof_line(sof_line),
    .sof_subsample(sof_subsample),
    .refclk_divider_value(refclk_divider_value),
    .genlock_enable(genlock_enable),
    
    
    .av_address(av_address),
    .av_read(av_read),
    .av_readdata(av_readdata),
    .av_write(av_write),
    .av_writedata(av_writedata),
    
    .status_update_int(status_update_int));