always @( posedge i_clk )
    if (control_state == EXECUTE && ((instruction[0] === 1'bx) || (instruction[31] === 1'bx)))
        begin
        `TB_ERROR_MESSAGE
        $display("Instruction with x's =%08h", instruction);
        end