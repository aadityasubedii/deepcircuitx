task mtrans_args;
    begin
    warmreg(reg_n);
    if (execute_instruction[21]) $fwrite(decompile_file,"!");
    $fwrite(decompile_file,", {");
    for (i=0;i<16;i=i+1)
        if (execute_instruction[i])  
            begin 
            warmreg(i); 
            if (more_to_come(execute_instruction[15:0], i))
                $fwrite(decompile_file,", "); 
            end
    $fwrite(decompile_file,"}");
    
    if (execute_instruction[22:20] == 3'b100)  
        $fwrite(decompile_file,"^");
    end
endtask