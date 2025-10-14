task wshift;
    begin                                                                                                        
    
    if (execute_instruction[6:5] != LSL || shift_imm != 5'd0)                                                    
        begin                                                                                                    
        case(execute_instruction[6:5])                                                                           
            2'd0: $fwrite(decompile_file,", lsl");                                                               
            2'd1: $fwrite(decompile_file,", lsr");                                                               
            2'd2: $fwrite(decompile_file,", asr");                                                               
            2'd3: if (shift_imm == 5'd0) $fwrite(decompile_file,", rrx"); else $fwrite(decompile_file,", ror");  
        endcase                                                                                                  

       if (execute_instruction[6:5] != 2'd3 || shift_imm != 5'd0)                                                
           $fwrite(decompile_file," #%1d", shift_imm);                                                           
       end                                                                                                       
    end                                                                                                          
endtask