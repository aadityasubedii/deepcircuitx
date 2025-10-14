        always @ (posedge rst or posedge clk) begin
            if (rst) begin
                genlock_enable_reg <= 2'b0;
                interrupt_enable <= 2'b0;
                enable_reg <= 1'b0;
                status_update_int_reg <= 1'b0;
                genlocked_int_reg <= 1'b0;
                
                is_mode_match <= {NO_OF_MODES_INT{1'b0}};
                genlocked_reg <= 1'b0;
                clear_underflow_sticky_reg <= 1'b0;
                write_trigger_ack_reg <= 1'b0;
            end else begin
                {genlock_enable_reg, interrupt_enable, enable_reg} <= (av_write && av_address == 8'd0) ? av_writedata[4:0] : {genlock_enable_reg, interrupt_enable, enable_reg};
                status_update_int_reg <= (mode_change | status_update_int_reg) & ~(clear_interrupts & av_writedata[1]) & interrupt_enable[0];
                genlocked_int_reg <= ((genlocked ^ genlocked_reg) | genlocked_int_reg) & ~(clear_interrupts & av_writedata[2]) & interrupt_enable[1];
                
                is_mode_match <= (mode_change) ? mode_match : is_mode_match;
                genlocked_reg <= genlocked;
                clear_underflow_sticky_reg <= ((av_write && av_address == 8'd1 && av_writedata[2]) | clear_underflow_sticky_reg) & underflow_sticky;
                write_trigger_ack_reg <= av_write_ack;
            end
        end