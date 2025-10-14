always @ (posedge clk or posedge rst) begin
    if(rst) begin
        int_valid_reg <= 1'b0;
        dout_data <= {DATA_WIDTH{1'b0}};
        dout_sop <= 1'b0;
        dout_eop <= 1'b0;
        int_ready_reg <= 1'b0;
    end else begin
        if(int_ready_reg) begin
            if(enable_synced) begin
                int_valid_reg <= int_valid;
                dout_data <= int_data;
                dout_sop <= int_sop;
                dout_eop <= int_eop;
            end else begin
                int_valid_reg <= 1'b0;
            end 
        end
        
        int_ready_reg <= dout_ready;
    end
end