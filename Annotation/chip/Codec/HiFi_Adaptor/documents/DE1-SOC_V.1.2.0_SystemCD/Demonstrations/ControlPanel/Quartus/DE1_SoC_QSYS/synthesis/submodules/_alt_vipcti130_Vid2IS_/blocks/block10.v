generate begin : avalon_st_output
    if(GENERATE_SYNC < 2) begin
        wire wrreq_post_swap;
        wire [DATA_WIDTH-1:0] data_post_swap;
        wire packet_post_swap;
        
        
        if(CONVERT_SEQ_TO_PAR) begin
            alt_vipcti130_Vid2IS_write_buffer #(
                    .DATA_WIDTH(DATA_WIDTH),
                    .NUMBER_OF_COLOUR_PLANES(NUMBER_OF_COLOUR_PLANES),
                    .BPS(BPS))
                write_buffer(
                    .rst(rst_vid_clk),
                    .clk(vid_clk_int),
                    
                    .convert(convert),
                    .hd_sdn(vid_hd_sdn_input),
                    .early_eop(early_eop),
                    
                    .wrreq_in(wrreq_pre_swap),
                    .data_in(data),
                    .packet_in(packet),
                    
                    .wrreq_out(wrreq_post_swap),
                    .data_out(data_post_swap),
                    .packet_out(packet_post_swap));
        end else begin
            assign data_post_swap = data;
            assign wrreq_post_swap = wrreq_pre_swap;
            assign packet_post_swap = packet;
        end
        
        wire [FIFO_WIDTH-1:0] q;
        wire empty;
        
        alt_vipcti130_common_fifo #(
                .DATA_WIDTH(FIFO_WIDTH),
                .CLOCKS_ARE_SAME(CLOCKS_ARE_SAME),
                .FIFO_DEPTH(FIFO_DEPTH_INT))
            input_fifo(
                .wrclk(vid_clk_int),
                .rdreq(rdreq),
                .aclr(rst_vid_clk),
                .rdclk(is_clk),
                .wrreq(wrreq_post_swap),
                .data({data_post_swap, packet_post_swap}),
                .rdusedw(usedw),
                .rdempty(empty),
                .wrfull(full),
                .q(q));
         
        wire enable_resync1;
        wire is_field_prediction;
        
        alt_vipcti130_common_sync #(CLOCKS_ARE_SAME) field_prediction_sync(
            .rst(rst),
            .sync_clock(is_clk),
            .data_in(field_prediction),
            .data_out(is_field_prediction));

        alt_vipcti130_common_sync #(CLOCKS_ARE_SAME) enable_resync_sync(
            .rst(rst),
            .sync_clock(is_clk),
            .data_in(enable_synced),
            .data_out(enable_resync1));
         
        
        
        
        alt_vipcti130_Vid2IS_av_st_output #(
                .FIFO_WIDTH(FIFO_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
                .NUMBER_OF_COLOUR_PLANES_IN_PARALLEL(NUMBER_OF_COLOUR_PLANES_IN_PARALLEL),
                .BPS(BPS))
            av_st_output(
                .rst(rst),
                
                .enable(enable_resync1),
                .q(q),
                .rdreq(rdreq),
                .empty(empty),
                .is_interlaced(is_interlaced),
                .is_sync_to(2'b10),
                .is_field_prediction(is_field_prediction),
                .is_active_sample_count(is_active_sample_count),
                .is_active_line_count_f0(is_active_line_count_f0),
                .is_active_line_count_f1(is_active_line_count_f1),
                
                .is_clk(is_clk),
                .is_ready(is_ready),
                .is_valid(is_valid),
                .is_data(is_data),
                .is_sop(is_sop),
                .is_eop(is_eop),
                
                .is_output_enable(is_output_enable));
    end else begin
        assign is_valid = 1'b0;
        assign is_sop = 1'b0;
        assign is_eop = 1'b0;
        assign is_data = {DATA_WIDTH{1'b0}};
    end
end endgenerate