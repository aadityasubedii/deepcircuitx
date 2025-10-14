    else if (get_1bit_signal(3) && !get_1bit_signal(0)  && !get_1bit_signal(1))     
        begin
        
        $fwrite(decompile_file, "%09d              read    addr ", `U_TB.clk_count);
        tmp_address = get_32bit_signal(2);
        fwrite_hex_drop_zeros(decompile_file, {tmp_address[31:2], 2'd0} );    
                     
        $fwrite(decompile_file, ", data %08h", get_32bit_signal(4));  
                                      
        if ( get_1bit_signal(2) ) 
            $fwrite(decompile_file, " aborted!\n");
        else                                 
            $fwrite(decompile_file, "\n");
        end