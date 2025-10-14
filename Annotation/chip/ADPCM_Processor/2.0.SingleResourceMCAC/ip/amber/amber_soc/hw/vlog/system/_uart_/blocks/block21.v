always @( posedge i_clk )
    if (( tx_bit_pulse_count == (TX_BITADJUST_COUNT-1) && txd_state == TXD_STOP2 ) ||
        ( tx_bit_pulse_count == (TX_BITPULSE_COUNT-1)  && txd_state != TXD_STOP2 )  )
        begin
        tx_bit_pulse_count <= 'd0;
        tx_bit_pulse       <= 1'd1;
        end
    else
        begin
        tx_bit_pulse_count <= tx_bit_pulse_count + 1'd1;
        tx_bit_pulse       <= 1'd0;
        end