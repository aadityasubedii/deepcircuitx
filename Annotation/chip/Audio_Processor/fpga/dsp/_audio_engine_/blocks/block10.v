    always @(posedge ck) begin

        if (status_we & (status_addr == 0)) begin
            allow_audio_writes <= wb_dbus_dat[0];
            control_reg_frame <= wb_dbus_dat[FRAME_W+2-1:2];
        end

        if (status_we & (status_addr == 3)) begin
            
            bank_done <= 0;
            if (allow_audio_writes) begin
                reset_req <= 1;
            end
        end

        if (status_we & (status_addr == 4)) begin
            i2s_in_offset  <= wb_dbus_dat[3:0];
            i2s_out_offset <= wb_dbus_dat[7:4];
        end

        if (reset & !bank_done) begin
            
            bank_done <= 1;
            bank_addr <= !bank_addr; 
        end

        if (reset_req) begin
            reset_req <= 0;
        end

    end