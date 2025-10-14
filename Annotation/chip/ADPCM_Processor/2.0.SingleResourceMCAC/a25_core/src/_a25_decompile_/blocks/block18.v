task cortrans_args;
    begin
    
    $fwrite(decompile_file,"%1d, ", execute_instruction[11:8]);
    
    $fwrite(decompile_file,"%1d, ", execute_instruction[23:21]);
    
    warmreg(reg_d); 
    
    $fwrite(decompile_file,", cr%1d", execute_instruction[19:16]);
    
    $fwrite(decompile_file,", cr%1d", execute_instruction[3:0]);
    
    $fwrite(decompile_file,", {%1d}",   execute_instruction[7:5]);
    end
endtask