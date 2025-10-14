task mult_args;
    begin
    warmreg(reg_n);  
    $fwrite(decompile_file,", ");
    warmreg(reg_m);
    $fwrite(decompile_file,", ");
    warmreg(reg_s); 

    if (execute_instruction[21]) 
        begin
        $fwrite(decompile_file,", ");
        warmreg(reg_d); 
        end
    end
endtask