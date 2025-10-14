    task write_to_file( 
        input integer fd, 
        input integer index, 
        input [RFF_BITS:1] data 
    );
        integer code;
        integer offset;
    
        begin
            offset = index * RFF_CHUNK;
            code = $fseek( fd, offset, 0 );
            if (code != 0)
            begin
                $display("%m: at time %t ERROR: fseek to %d failed", $time, offset);
                $finish;
            end
        
            
            if (data[1] === 1'bz)
                data[1] = 1'bx;
            else if (data[1] === 1'b0)
                data[1] = 1'bz;

            $fwrite( fd, "%z", data );
        end
    endtask