always @ ( posedge i_clk )
    if (fifo_enable)
        rx_interrupt <=  rx_fifo_half_or_more || rx_int_timer == RX_INTERRUPT_COUNT;
    else    
        rx_interrupt <=  rx_fifo_full;