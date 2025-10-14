generate begin : sync_generation_generate
    if(GENERATE_SYNC > 0) begin
        alt_vipcti130_common_sync_generation sync_generation(
            .rst(rst_vid_clk),
            .clk(vid_clk_int),
            
            .clear_enable(1'b0),
            .enable_count(vid_enable_int),
            .hd_sdn(vid_hd_sdn_input),
            .start_of_vsync(start_of_vsync),
            .field_prediction(field_prediction_nxt),
            .interlaced(interlaced),
            .total_sample_count(total_sample_count[14:1]),
            .total_sample_count_valid(total_sample_count[0]),
            .total_line_count(total_line_count[13:1]),
            .total_line_count_valid(total_line_count[0]),
            .stable(stable),
            
            .divider_value(refclk_divider_value_sync1),
            .sof_sample(sof_sample_sync1),
            .sof_line(sof_line_sync1),
            .sof_subsample(sof_subsample_sync1),
            
            .output_enable(genlock_enable_sync1),
            .sof(sof),
            .sof_locked(sof_locked),
            .div(refclk_div));

            defparam sync_generation.NUMBER_OF_COLOUR_PLANES = NUMBER_OF_COLOUR_PLANES,
                     sync_generation.COLOUR_PLANES_ARE_IN_PARALLEL = COLOUR_PLANES_ARE_IN_PARALLEL,
                     sync_generation.LOG2_NUMBER_OF_COLOUR_PLANES = LOG2_NUMBER_OF_COLOUR_PLANES,
                     sync_generation.TOTALS_MINUS_ONE = 0;
    end else begin
        assign sof = 1'b0;
        assign sof_locked = 1'b0;
    end
end endgenerate