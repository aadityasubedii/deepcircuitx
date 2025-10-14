task regop_args;
    begin
    if (!opcode_compare)
        warmreg(reg_d);
        
    if (!opcode_move )
        begin
        if (!opcode_compare)
            begin
            $fwrite(decompile_file,", ");
            if (reg_d < 4'd10 || reg_d > 4'd12) 
                $fwrite(decompile_file," ");
            end
        warmreg(reg_n);
        $fwrite(decompile_file,", ");
        if (reg_n < 4'd10 || reg_n > 4'd12) 
            $fwrite(decompile_file," ");
        end
    else
        begin
        $fwrite(decompile_file,", ");
        if (reg_d < 4'd10 || reg_d > 4'd12) 
            $fwrite(decompile_file," ");
        end    
            
    if (shift_op_imm)  
        begin
        if (|imm32[31:15])
            $fwrite(decompile_file,"#0x%08h", imm32);
        else
            $fwrite(decompile_file,"#%1d", imm32);
        end        
    else 
        begin
        warmreg(reg_m);
        if (execute_instruction[4]) 
            
            wshiftreg;
        else 
            
            wshift;
        end       
    end
endtask