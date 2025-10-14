        always @(posedge clk or posedge reset) begin
            if (reset)
                internal_out_valid <= 0;
            else begin
                internal_out_valid <= !empty & ok_to_forward & ~drop_on_error;

                if (read) begin
                    if (incremented_rd_ptr == wr_ptr)
                        internal_out_valid <= 1'b0;
                end
            end
        end