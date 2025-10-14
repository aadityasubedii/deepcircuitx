task branch_args;
reg [31:0] shift_amount;
    begin
    if (execute_instruction[23]) 
        shift_amount = {~execute_instruction[23:0] + 24'd1, 2'd0};
    else
        shift_amount = {execute_instruction[23:0], 2'd0};

    if (execute_instruction[23]) 
        fwrite_hex_drop_zeros ( decompile_file, get_reg_val( 5'd21 ) - shift_amount );
    else             
        fwrite_hex_drop_zeros ( decompile_file, get_reg_val( 5'd21 ) + shift_amount );
    end
endtask