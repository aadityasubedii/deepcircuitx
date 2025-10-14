task wcond;
    begin
    case( condition)
        4'h0:    $fwrite(decompile_file,"eq");
        4'h1:    $fwrite(decompile_file,"ne");
        4'h2:    $fwrite(decompile_file,"cs");
        4'h3:    $fwrite(decompile_file,"cc");
        4'h4:    $fwrite(decompile_file,"mi");
        4'h5:    $fwrite(decompile_file,"pl");
        4'h6:    $fwrite(decompile_file,"vs");
        4'h7:    $fwrite(decompile_file,"vc");
        4'h8:    $fwrite(decompile_file,"hi");
        4'h9:    $fwrite(decompile_file,"ls"); 
        4'ha:    $fwrite(decompile_file,"ge"); 
        4'hb:    $fwrite(decompile_file,"lt");
        4'hc:    $fwrite(decompile_file,"gt");
        4'hd:    $fwrite(decompile_file,"le"); 
        4'he:    $fwrite(decompile_file,"  ");  
        default: $fwrite(decompile_file,"nv");  
    endcase    
    end
endtask