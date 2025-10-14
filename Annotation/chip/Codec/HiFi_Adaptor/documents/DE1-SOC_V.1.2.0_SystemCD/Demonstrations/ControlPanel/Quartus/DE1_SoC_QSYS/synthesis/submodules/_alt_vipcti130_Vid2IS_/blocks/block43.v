always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if (rst_vid_clk) begin
        vid_data_input <= {DATA_WIDTH{1'b0}};
        vid_datavalid_input <= 1'b0;
        vid_f_input <= 1'b0;
        vid_v_sync_input <= 1'b0;
        vid_h_sync_input <= 1'b0;
        vid_hd_sdn_input <= 1'b0;
    end else begin
        vid_data_input <= vid_data;
        if (~USE_EMBEDDED_SYNCS && ADD_DATA_ENABLE_SIGNAL)
            vid_datavalid_input <= vid_de;
        else
            vid_datavalid_input <= vid_datavalid;
        vid_f_input <= vid_f;
        vid_v_sync_input <= vid_v_sync;
        vid_h_sync_input <= vid_h_sync;
        if(CONVERT_SEQ_TO_PAR)
            vid_hd_sdn_input <= vid_hd_sdn;
        else
            vid_hd_sdn_input <= COLOUR_PLANES_ARE_IN_PARALLEL;
    end
end