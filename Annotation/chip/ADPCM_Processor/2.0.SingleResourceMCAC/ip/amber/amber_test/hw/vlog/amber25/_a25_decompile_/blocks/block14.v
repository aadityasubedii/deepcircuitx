task swap_args;
    begin
    warmreg(reg_d);
    $fwrite(decompile_file,", ");
    warmreg(reg_m);
    $fwrite(decompile_file,", [");
    warmreg(reg_n); 
    $fwrite(decompile_file,"]");
    end
endtask