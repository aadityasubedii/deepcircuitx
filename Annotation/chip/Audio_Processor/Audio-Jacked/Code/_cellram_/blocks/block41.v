    initial begin
        $timeformat (-9, 3, " ns", 1);
        sync_access <= 1'b0;
        software_access_rcr_write = 1'b0;
        async_wr_lockout = 0;
        ref_collision <= 0;
        tm_power_up <= 0.0;
        register_write(BCR, BCR_DEFAULT, 1'b0);
        register_write(RCR, RCR_DEFAULT, 1'b0);
        memory_used = 0;
    end