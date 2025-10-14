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