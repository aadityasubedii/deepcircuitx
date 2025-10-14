        always @ (posedge rst or posedge clk) begin
            if(rst) begin
                genlock_enable <= 1'b0;
                interrupt_enable <= 2'b00;
                enable_reg <= 1'b0;
                status_update_int_reg <= 1'b0;
                stable_int_reg <= 1'b0;
                sof_sample <= 14'd0;
                sof_subsample <= 2'd0;
                sof_line <= 13'd0;
                refclk_divider_value <= 14'd0;
                
                is_stable_reg <= 1'b0;
                resolution_change_reg <= 1'b0;
                clear_overflow_sticky_reg <= 1'b0;
             end else begin
                {genlock_enable, interrupt_enable, enable_reg} <= (av_write && av_address == 4'd0) ? av_writedata[3:0] : {genlock_enable, interrupt_enable, enable_reg};
                status_update_int_reg <= ((resolution_change ^ resolution_change_reg) | status_update_int_reg) & ~(clear_interrupts & av_writedata[1]) & interrupt_enable[0];
                stable_int_reg <= ((is_stable ^ is_stable_reg) | stable_int_reg) & ~(clear_interrupts & av_writedata[2]) & interrupt_enable[1];
                if(av_write && av_address == 4'd11) begin
                    sof_sample <= av_writedata[15:2];
                    sof_subsample <= av_writedata[1:0];
                end
                sof_line <= (av_write && av_address == 4'd12) ? av_writedata[12:0] : sof_line;
                refclk_divider_value <= (av_write && av_address == 4'd13) ? av_writedata[13:0] : refclk_divider_value;
                
                is_stable_reg <= is_stable;
                resolution_change_reg <= resolution_change;
                clear_overflow_sticky_reg <= ((av_write && av_address == 4'd1 && av_writedata[9]) | clear_overflow_sticky_reg) & overflow_sticky;
             end
        end