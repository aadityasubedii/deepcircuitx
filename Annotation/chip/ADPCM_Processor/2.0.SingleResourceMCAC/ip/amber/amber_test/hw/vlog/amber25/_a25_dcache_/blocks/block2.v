        begin
        `TB_ERROR_MESSAGE
        $display("Unsupported number of ways %0d", WAYS);
        $display("Set A25_DCACHE_WAYS in a25_config_defines.v to either 2,3,4 or 8");
        end