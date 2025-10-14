        always @(posedge clk or posedge reset) begin
            if (reset) begin
                out_valid   <= 0;
                out_payload <= 0;
            end
            else begin
                if (internal_out_ready) begin
                    out_valid   <= internal_out_valid & ok_to_forward;
                    out_payload <= internal_out_payload;
                end
            end
        end