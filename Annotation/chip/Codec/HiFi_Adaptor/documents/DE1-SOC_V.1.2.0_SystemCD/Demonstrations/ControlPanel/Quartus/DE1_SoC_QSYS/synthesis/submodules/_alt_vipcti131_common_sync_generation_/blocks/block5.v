always @ (posedge rst or posedge clk) begin
    if(rst) begin
        enable_reg <= 1'b0;
        
        sof_count <= 4'd0;
        sof <= 1'b0;
        sof_locked <= 1'b0;
        div_reg <= 1'b0;
        sclr <= 1'b0;
        first_sof <= 1'b0;
    end else begin
        enable_reg <= enable;
        
        if(output_enable) begin
            if(sof_count == 4'd0) begin
                sof <= sof_next;
                if(sof_next)
                    sof_count = 4'b1111;
            end else begin
                sof_count = sof_count - 4'd1;
            end
            sof_locked <= enable & total_line_count_valid;
            div_reg <= div_next;
            sclr <= sof_next;
            first_sof <= enable & (sof_next | first_sof);
        end else begin
            sof <= 1'b0;
            sof_locked <= 1'b0;
            div_reg <= 1'b0;
            sclr <= 1'b0;
            first_sof <= 1'b0;
        end
    end
end