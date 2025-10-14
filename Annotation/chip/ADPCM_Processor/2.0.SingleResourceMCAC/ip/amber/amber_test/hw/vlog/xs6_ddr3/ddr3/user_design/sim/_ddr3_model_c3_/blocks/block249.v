    begin : file_io_open
        integer bank;

        if (!$value$plusargs("model_data+%s", tmp_model_dir))
        begin
            tmp_model_dir = "/tmp";
            $display(
                "%m: at time %t WARNING: no +model_data option specified, using /tmp.",
                $time
            );
        end

        for (bank = 0; bank < `BANKS; bank = bank + 1)
            memfd[bank] = open_bank_file(bank);
    end