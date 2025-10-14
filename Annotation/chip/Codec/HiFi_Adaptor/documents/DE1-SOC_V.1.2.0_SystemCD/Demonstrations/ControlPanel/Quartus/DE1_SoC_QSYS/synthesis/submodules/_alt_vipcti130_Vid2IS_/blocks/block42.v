generate begin : use_embedded_syncs_generate
    if(USE_EMBEDDED_SYNCS) begin
        assign vid_enable_int = vid_datavalid_input;  
                                                      
        
        alt_vipcti130_Vid2IS_embedded_sync_extractor#(
                .DATA_WIDTH(DATA_WIDTH),
                .BPS(BPS),
                .BASE(BASE),
                .GENERATE_ANC(GENERATE_ANC))
            sync_extractor(
                .rst(rst_vid_clk),
                .clk(vid_clk_int),
    
                
                .vid_locked(vid_locked),
                .vid_enable(vid_enable_int),
                .vid_hd_sdn(vid_hd_sdn_input),
                .vid_data_in(vid_data_input),
    
                
                .vid_f(vid_f_int),
                .vid_h_sync(vid_h_sync_int),
                .vid_v_sync(vid_v_sync_int),
                .vid_datavalid(vid_datavalid_int),
                .vid_anc_valid(vid_anc_valid_int),
                .vid_data_out(vid_data_int));
    end else begin
        assign vid_enable_int = (ADD_DATA_ENABLE_SIGNAL==1) ? vid_datavalid : 1'b1;
    
        alt_vipcti130_Vid2IS_sync_polarity_convertor hsync_convertor(
            .rst(rst_vid_clk),
            .clk(vid_clk_int),
            
            .sync_in(vid_h_sync_input),
            .datavalid(vid_datavalid_input),
            .sync_out(vid_h_sync_int));
            
        alt_vipcti130_Vid2IS_sync_polarity_convertor vsync_convertor(
            .rst(rst_vid_clk),
            .clk(vid_clk_int),
            
            .sync_in(vid_v_sync_input),
            .datavalid(vid_datavalid_input),
            .sync_out(vid_v_sync_int));
            
        assign vid_f_int = vid_f_input;
        assign vid_datavalid_int = vid_datavalid_input;
        assign vid_anc_valid_int = 1'b0;
        assign vid_data_int = vid_data_input;
    end
end endgenerate