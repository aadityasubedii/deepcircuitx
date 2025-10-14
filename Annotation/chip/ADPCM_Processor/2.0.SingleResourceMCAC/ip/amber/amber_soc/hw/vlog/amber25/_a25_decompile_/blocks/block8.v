task warmreg;
input [3:0] regnum;
    begin
    if (regnum < 4'd12)
        $fwrite(decompile_file,"r%1d", regnum);
    else
    case (regnum)
        4'd12   : $fwrite(decompile_file,"ip");
        4'd13   : $fwrite(decompile_file,"sp");
        4'd14   : $fwrite(decompile_file,"lr");
        4'd15   : $fwrite(decompile_file,"pc");
    endcase
    end
endtask