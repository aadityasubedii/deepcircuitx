always @( posedge i_clk )
    if ( !i_fetch_stall && i_instruction_valid )
        begin
        execute_instruction <= i_instruction;
        execute_address     <= i_instruction_address;
        execute_undefined   <= i_instruction_undefined;
        execute_now         <= 1'd1;
        end