always @ ( posedge `U_SYSTEM.clk )
    if ( timeout != 0 )
        if (`U_TB.clk_count >= timeout)
            begin
            `TB_ERROR_MESSAGE
            $display("Timeout Error. Edit $AMBER_BASE/hw/tests/timeouts.txt to change the timeout");
            end