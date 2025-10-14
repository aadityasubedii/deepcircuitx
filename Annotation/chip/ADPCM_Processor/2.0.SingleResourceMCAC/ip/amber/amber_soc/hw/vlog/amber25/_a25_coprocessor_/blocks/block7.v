always @ ( posedge i_clk )
    if ( !i_core_stall )
        begin
        if ( i_fault )
            begin
            
            `ifdef A25_COPRO15_DEBUG    
            $display ("Fault status  set to 0x%08x", i_fault_status);
            $display ("Fault address set to 0x%08x", i_fault_address);
            `endif        
            fault_status    <= i_fault_status;
            fault_address   <= i_fault_address;
            end
        end