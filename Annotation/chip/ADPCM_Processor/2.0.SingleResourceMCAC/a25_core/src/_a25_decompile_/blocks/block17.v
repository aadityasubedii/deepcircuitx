task codtrans_args;
    begin
    
    $fwrite(decompile_file,"%1d, ", execute_instruction[11:8]);
    
    $fwrite(decompile_file,"cr%1d, ", execute_instruction[15:12]);
    
    warmreg(reg_n); 
    end
endtask