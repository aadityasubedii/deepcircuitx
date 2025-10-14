task trans_args;
    begin
    warmreg(reg_d);   

    casez ({execute_instruction[25:23], execute_instruction[21], no_shift, offset12==12'd0})
           6'b0100?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #-%1d]" , offset12); end
           6'b0110?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #%1d]"  , offset12); end
           6'b0100?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0110?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0101?? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #-%1d]!", offset12); end
           6'b0111?? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", #%1d]!" , offset12); end

           6'b0000?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #-%1d", offset12); end
           6'b0010?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #%1d" , offset12); end
           6'b0001?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #-%1d", offset12); end
           6'b0011?0 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], #%1d" , offset12); end
     
           6'b0000?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0010?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0001?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end
           6'b0011?1 : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"]"); end

           6'b11001? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); $fwrite(decompile_file,"]");  end
           6'b11101? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); $fwrite(decompile_file,"]");  end
           6'b11011? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); $fwrite(decompile_file,"]!"); end
           6'b11111? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); $fwrite(decompile_file,"]!"); end

           6'b10001? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m);  end
           6'b10101? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m);  end
           6'b10011? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m);  end
           6'b10111? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m);  end

           6'b11000? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); wshift; $fwrite(decompile_file,"]"); end
           6'b11100? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); wshift; $fwrite(decompile_file,"]"); end
           6'b11010? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", -");  warmreg(reg_m); wshift; $fwrite(decompile_file,"]!");end
           6'b11110? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,", ");   warmreg(reg_m); wshift; $fwrite(decompile_file,"]!");end

           6'b10000? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m); wshift; end
           6'b10100? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m); wshift; end
           6'b10010? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], -"); warmreg(reg_m); wshift; end
           6'b10110? : begin $fwrite(decompile_file,", ["); warmreg(reg_n); $fwrite(decompile_file,"], ");  warmreg(reg_m); wshift; end

    endcase       
    end
endtask