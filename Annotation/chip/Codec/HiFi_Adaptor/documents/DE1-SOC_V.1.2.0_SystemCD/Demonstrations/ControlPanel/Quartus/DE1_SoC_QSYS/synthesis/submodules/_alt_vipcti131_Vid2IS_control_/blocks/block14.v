        assign av_readdata = (av_address == 4'd1)  ? {{5{1'b0}}, is_resolution_valid,
                                                                 overflow_sticky,
                                                                 is_stable,
                                                                 is_interlaced,
                                                                 is_active_line_count_f1[0] & is_total_line_count_f1[0],
                                                                 1'b0,
                                                                 is_active_line_count_f0[0] & is_total_line_count_f0[0],
                                                                 is_active_sample_count[0] & is_total_sample_count[0],
                                                                 2'b0,
                                                                 is_output_enable} :
                             (av_address == 4'd2)  ? {13'd0, stable_int_reg, status_update_int_reg, 1'b0} :
                             (av_address == 4'd3)  ? usedw_output :
                             (av_address == 4'd4)  ? is_active_sample_count[16:1] :
                             (av_address == 4'd5)  ? is_active_line_count_f0[16:1] :
                             (av_address == 4'd6)  ? is_active_line_count_f1[16:1] :
                             (av_address == 4'd7)  ? is_total_sample_count[16:1] :
                             (av_address == 4'd8)  ? is_total_line_count_f0[16:1] :
                             (av_address == 4'd9)  ? is_total_line_count_f1[16:1] :
                             (av_address == 4'd10) ? is_std :
                             (av_address == 4'd11) ? {sof_sample, sof_subsample} :
                             (av_address == 4'd12) ? {3'd0, sof_line} :
                             (av_address == 4'd13) ? {2'd0, refclk_divider_value} :
                             {{12{1'b0}}, genlock_enable, interrupt_enable, enable_reg};