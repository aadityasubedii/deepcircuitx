    always @(posedge wb_clk) begin

        if (writing & !wb_rst) begin

            case (io_addr)
                0   :   reg_addr   <= wb_dbus_dat[23:0];
                1   :   reg_step   <= wb_dbus_dat[15:0];
                2   :   reg_cycles <= wb_dbus_dat[15:0];
                3   :   reg_blocks <= wb_dbus_dat[15:0];
                4   :   begin   reg_start_req <= 1; reg_repeat <= wb_dbus_dat[0]; end
                5   :   begin   reg_start_req <= 0; reg_repeat <= 0;              end
                7   :   reg_match  <= wb_dbus_dat[23:0];
            endcase

        end

        if (xfer_done & reg_repeat & running) begin
            if (reg_start_req) begin
                reg_start_req <= 0;
            end else begin
                reg_start_req <= 1;
            end
        end

        if (wb_rst) begin

            reg_addr <= 0;
            reg_match <= 0;
            reg_step <= 0;
            reg_cycles <= 0;
            reg_blocks <= 0;
            reg_start_req <= 0;
            reg_repeat <= 0;

        end

    end