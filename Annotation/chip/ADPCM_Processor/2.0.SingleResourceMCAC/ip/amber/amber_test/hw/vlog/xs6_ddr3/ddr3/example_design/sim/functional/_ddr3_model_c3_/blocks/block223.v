    function [RFF_BITS:1] read_from_file( 
        input integer fd, 
        input integer index 
    );
        integer code;
        integer offset;
        reg [1024:1] msg;
        reg [RFF_BITS:1] read_value;
    
        begin
            offset = index * RFF_CHUNK;
            code = $fseek( fd, offset, 0 );
            
            if (code != 0)
            begin
                $display("%m: at time %t ERROR: fseek to %d failed", $time, offset);
                $finish;
            end
        
            code = $fscanf(fd, "%z", read_value);
            
            if (code != 1)
            begin
                if ($ferror(fd,msg) != 0)
                begin
                    $display("%m: at time %t ERROR: fscanf failed at %d", $time, index);
                    $display(msg);
                    $finish;
                end
                else
                    read_value = 'hx;
            end
    
            



            if (read_value[1] === 1'bz)
                
                read_value[1] = 1'b0;
            else if (read_value[1] === 1'b0)
                
                read_value = 'hx;

            read_from_file = read_value;
        end
    endfunction