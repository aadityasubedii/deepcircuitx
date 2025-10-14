task w_mtrans_type;
    begin
    case( mtrans_itype )
        4'h0:    $fwrite(decompile_file,"da");
        4'h1:    $fwrite(decompile_file,"ia");
        4'h2:    $fwrite(decompile_file,"db");
        4'h3:    $fwrite(decompile_file,"ib");
        default: $fwrite(decompile_file,"xx");
    endcase    
    end
endtask