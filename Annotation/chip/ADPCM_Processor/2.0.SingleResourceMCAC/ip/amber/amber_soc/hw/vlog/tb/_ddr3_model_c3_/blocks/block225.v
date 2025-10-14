    function integer open_bank_file( input integer bank );
        integer fd;
        reg [2048:1] filename;
        begin 
            $sformat( filename, "%0s/%m.%0d", tmp_model_dir, bank );

            fd = $fopen(filename, "w+");
            if (fd == 0)
            begin
                $display("%m: at time %0t ERROR: failed to open %0s.", $time, filename);
                $finish;
            end
            else
            begin
                if (DEBUG) $display("%m: at time %0t INFO: opening %0s.", $time, filename);
                open_bank_file = fd;
            end

        end
    endfunction