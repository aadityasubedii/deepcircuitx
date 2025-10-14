always @ (posedge rst or posedge clk) begin
    if(rst) begin
        h_count <= 14'd0;
        v_count <= 13'd0;
    end else begin
        if(sclr) begin
            h_count <= h_reset + {{13{1'b0}}, count_sample & hd_sdn};
            v_count <= v_reset;
        end else if(enable) begin
            if(new_line) begin
                h_count <= 14'd0;
                if(v_count >= v_total_int)
                    v_count <= 13'd0;
                else
                    v_count <= v_count + 13'd1;
            end else if(count_sample)
                h_count <= h_count + 14'd1;
        end
    end
end