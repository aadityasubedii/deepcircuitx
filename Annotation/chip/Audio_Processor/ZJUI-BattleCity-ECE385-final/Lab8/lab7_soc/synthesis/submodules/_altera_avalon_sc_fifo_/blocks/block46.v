        always @(posedge clk or posedge reset) begin
            if (reset) begin
                wr_ptr <= 0;
                rd_ptr <= 0;
            end
            else begin
                wr_ptr <= next_wr_ptr;
                rd_ptr <= next_rd_ptr;
            end
        end