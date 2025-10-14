        always @ (posedge clk) begin
            genlock_enable <= 1'b0;
            sof_sample <= 14'd0;
            sof_subsample <= 2'd0;
            sof_line <= 13'd0;
            refclk_divider_value <= 14'd0;
        end