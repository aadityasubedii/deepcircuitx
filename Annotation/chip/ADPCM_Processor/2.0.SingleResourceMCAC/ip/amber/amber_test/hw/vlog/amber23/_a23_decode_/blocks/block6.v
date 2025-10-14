always @ ( posedge i_clk )
    if ( !i_fetch_stall )
        begin
        irq   <= i_irq;
        firq  <= i_firq;

        if ( control_state == INT_WAIT1 && status_bits_mode_r == SVC )
            begin
            dabt_reg  <= 1'd0;
            end
        else
            begin
            dabt_reg  <= dabt_reg || i_dabt;
            end

        dabt_reg_d1  <= dabt_reg;
        end