always @( posedge i_clk )
    
    if ( get_1bit_signal(0) && !get_1bit_signal(1) )
        begin
        
        $fwrite(decompile_file, "%09d              write   addr ", `U_TB.clk_count);
        tmp_address = get_32bit_signal(2);
        fwrite_hex_drop_zeros(decompile_file, {tmp_address [31:2], 2'd0} );
                  
        $fwrite(decompile_file, ", data %08h, be %h", 
                get_32bit_signal(3),    
                get_4bit_signal (0));   
                                       
        if ( get_1bit_signal(2) ) 
            $fwrite(decompile_file, " aborted!\n");
        else                                 
            $fwrite(decompile_file, "\n");
        end