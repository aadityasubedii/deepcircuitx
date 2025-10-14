task wshiftreg;
    begin
    case(execute_instruction[6:5])
        2'd0: $fwrite(decompile_file,", lsl ");
        2'd1: $fwrite(decompile_file,", lsr ");
        2'd2: $fwrite(decompile_file,", asr ");
        2'd3: $fwrite(decompile_file,", ror "); 
    endcase

    warmreg(reg_s); 
    end
endtask