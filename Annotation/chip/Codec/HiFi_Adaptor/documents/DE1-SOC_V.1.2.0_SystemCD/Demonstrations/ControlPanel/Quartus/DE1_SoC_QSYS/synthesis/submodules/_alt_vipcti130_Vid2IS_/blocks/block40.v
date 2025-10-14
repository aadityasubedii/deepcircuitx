always @ (posedge rst_vid_clk or posedge vid_clk_int) begin
    if(rst_vid_clk) begin
        valid_reg <= 1'b0;
        convert <= 1'b0;
        data_reg <= {DATA_WIDTH{1'b0}};
        vid_f_reg <= 1'b0;
        vid_h_sync_reg <= 1'b0;
        vid_v_sync_reg <= 1'b0;
        vid_datavalid_reg <= 1'b0;
        vid_anc_valid_reg <= 1'b0;
    end else begin
        if(overflow_nxt) begin 
                               
            valid_reg <= valid_reg;
            convert <= convert;
        end else begin
            valid_reg <= (valid_nxt | valid_reg) & ~eop;
            convert <= ((vid_enable_int & vid_datavalid_int) | convert) & ~eop;   
        end
        data_reg <= (valid_nxt) ? vid_data_int : data_reg;
        
        if(vid_enable_int) begin
            vid_f_reg <= vid_f_int;
            vid_h_sync_reg <= vid_h_sync_int;
            vid_v_sync_reg <= vid_v_sync_int;
            vid_datavalid_reg <= vid_datavalid_int;
            vid_anc_valid_reg <= vid_anc_valid_int;
        end
    end
end